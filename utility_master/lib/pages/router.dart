import 'package:fast_log/fast_log.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:serviced/serviced.dart';
import 'package:utility_master/pages/app_landing.dart';
import 'package:utility_master/pages/home.dart';
import 'package:utility_master/pages/login/page_login.dart';
import 'package:utility_master/pages/login/screen_spalsh.dart';
import 'package:utility_master/pages/showcase.dart';
import 'package:utility_master/util/svc/login.dart';
import 'package:utility_master/util/svc/user.dart';
import 'package:utility_master/util/svc/widget_binding.dart';

final GoRouter router = GoRouter(
  initialLocation: "/",
  observers: [LoggingObserver()],
  routes: [
    _r("/", LandingPage(), routes: [
      _r("home1", Home()),
      _r("home2", Home()),
      _r("settings", ShowcasePage()),
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
