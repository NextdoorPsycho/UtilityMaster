import 'dart:async';

import 'package:fast_log/fast_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serviced/serviced.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:toxic/toxic.dart';
import 'package:utility_master/pages/router.dart';
import 'package:utility_master/theme/shad_dark.dart';
import 'package:utility_master/theme/widgets/title_bar.dart';
import 'package:utility_master/util/bloc/bloc.dart';
import 'package:utility_master/util/magic.dart';
import 'package:utility_master/util/svc/registrar.dart';
import 'package:window_manager/window_manager.dart';

void main() => runZonedGuarded(() async {
      await registerServices();
      if (isWindowManaged) {
        await Window.initialize();
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
          await Window.setEffect(
              effect: WindowEffect.solid,
              dark: true,
              color: Colors.transparent);
        });
      }
      runApp(const MyApp());
    }, (e, es) {
      error("Caught Error: $e");
      error(es);
    });

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
            color: Colors.black.withOpacity(0.9),
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
      child: themeMode.unique.buildNullable((t) => ShadApp.materialRouter(
            debugShowCheckedModeBanner: false,
            themeMode: t ?? ThemeMode.system,
            darkTheme: ShadThemeData(
              brightness: Brightness.dark,
              colorScheme: MonochromeShadSlateColorScheme.dark(
                background: Colors.black.withOpacity(0.9),
              ),
            ),
            theme: ShadThemeData(
              brightness: Brightness.light,
              colorScheme: MonochromeShadSlateColorScheme.light(
                background: Colors.white.withOpacity(0.9),
              ),
            ),
            title: "Utility Master",
            routerConfig: router,
          ))));
}
