import 'dart:async';

import 'package:fast_log/fast_log.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rxdart/rxdart.dart';
import 'package:serviced/serviced.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:toxic/toxic.dart';
import 'package:universal_io/io.dart';
import 'package:utility_master/pages/app_landing.dart';
import 'package:utility_master/pages/login/page_login.dart';
import 'package:utility_master/pages/login/screen_spalsh.dart';
import 'package:utility_master/theme/shad_dark.dart';
import 'package:utility_master/theme/widgets/title_bar.dart';
import 'package:utility_master/util/bloc/bloc.dart';
import 'package:utility_master/util/svc/firebase.dart';
import 'package:utility_master/util/svc/logging.dart';
import 'package:utility_master/util/svc/login.dart';
import 'package:utility_master/util/svc/user.dart';
import 'package:utility_master/util/svc/widget_binding.dart';
import 'package:window_manager/window_manager.dart';

String get u {
  try {
    return FirebaseAuth.instance.currentUser!.uid;
  } catch (e, es) {
    error(es);
    return "No User";
  }
}

bool get isWindowManaged =>
    !kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS);
void main() => runZonedGuarded(() async {
      await _registerServices();
      if (isWindowManaged) {
        await windowManager.ensureInitialized();
        success("Window Managed");
        WindowOptions windowOptions = const WindowOptions(
          size: Size(800, 600),
          minimumSize: Size(800, 600),
          center: true,
          backgroundColor: Colors.transparent,
          skipTaskbar: false,
          titleBarStyle: TitleBarStyle.hidden,
        );
        windowManager.waitUntilReadyToShow(windowOptions, () async {
          await windowManager.show();
          await windowManager.focus();
        });
      }

      runApp(const MyApp());
    }, (e, es) {
      error("Caught Error: $e");
      error(es);
    });

Future<void> _registerServices() async {
  services().register<WidgetsBindingService>(() => WidgetsBindingService(),
      lazy: false);
  services().register<FirebaseService>(() => FirebaseService(), lazy: false);
  services().register<BlocService>(() => BlocService(), lazy: false);
  services().register<UserService>(() => UserService(), lazy: true);
  services().register<LoginService>(() => LoginService(), lazy: true);
  services().register<LoggingService>(() => LoggingService(), lazy: false);
  await services().waitForStartup();
}

BehaviorSubject<ThemeMode> themeMode = BehaviorSubject.seeded(ThemeMode.system);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget injectTitleBar(Widget child) {
    if (isWindowManaged) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          TitleBar(
            leading: const Icon(Icons.hexagon_outlined, color: Colors.white)
                .padRight(7),
            surfaceColor: Colors.white,
            title: const Text("Utility Master"),
            color: Colors.black.withOpacity(0.95),
          ),
          Expanded(child: child)
        ],
      );
    }

    return child;
  }

  @override
  Widget build(BuildContext context) => injectTitleBar(MultiBlocProvider(
      providers: svc<BlocService>().onRegisterProviders().toList(),
      child: themeMode.buildNullable((t) => ShadApp.materialRouter(
            debugShowCheckedModeBanner: false,
            themeMode: t ?? ThemeMode.system,
            darkTheme: ShadThemeData(
              brightness: Brightness.dark,
              colorScheme: MonochromeShadSlateColorScheme.dark(
                background: Colors.black.withOpacity(0.95),
              ),
            ),
            theme: ShadThemeData(
              brightness: Brightness.light,
              colorScheme: MonochromeShadSlateColorScheme.light(
                background: Colors.white.withOpacity(0.95),
              ),
            ),
            title: "Utility Master",
            routerConfig: router,
          ))));
}

final GoRouter router = GoRouter(
  initialLocation: "/",
  observers: [LoggingObserver()],
  routes: [
    _r("/", LandingPage(), routes: [
      _r("page1", PageOne()),
      _r("page2", PageTwo()),
      _r("page3", PageThree()),
    ]),
    _r("/splash", const SplashScreen()),
    _r("/login", const LoginScreen()),
  ],
  redirect: (context, state) {
    verbose("RDIR: ${state.uri}");
    if (state.uri.toString().startsWith("/splash") ||
        state.uri.toString().startsWith("/login")) {
      verbose("Redirecting to splash, Already on splash.");
      svc<WidgetsBindingService>().dropSplash();
      return null;
    }

    if (!svc<LoginService>().isSignedIn() || !svc<UserService>().bound) {
      verbose("Redirecting to splash, Not logged in.");
      return "/splash";
    }

    verbose("Redirecting to landing, Logged in.");

    svc<WidgetsBindingService>().dropSplash();
    return null;
  },
);

class LoggingObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    navigation("Pushed ${route.settings}");
  }
}

GoRoute _r(String u, Widget to, {List<RouteBase> routes = const []}) => GoRoute(
      path: u,
      builder: (BuildContext context, GoRouterState state) => to,
      routes: routes,
    );

GoRoute _p(String u, Widget Function(Map<String, String> p) to,
        {List<RouteBase> routes = const []}) =>
    GoRoute(
        path: u,
        builder: (context, state) => to(state.pathParameters),
        routes: routes);

GoRoute _q(String u, Widget Function(Map<String, String> p) to,
        {List<RouteBase> routes = const []}) =>
    GoRoute(
        path: u,
        builder: (context, state) => to(state.uri.queryParameters),
        routes: routes);
