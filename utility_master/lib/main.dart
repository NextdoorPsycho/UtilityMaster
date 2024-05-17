import 'dart:async';

import 'package:bar/bar.dart';
import 'package:fast_log/fast_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:padded/padded.dart';
import 'package:serviced/serviced.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:toxic/toxic.dart';
import 'package:universal_io/io.dart';
import 'package:utility_master/pages/router.dart';
import 'package:utility_master/theme/animatory/ticking_icon.dart';
import 'package:utility_master/theme/shad_dark.dart';
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
          titleBarStyle: TitleBarStyle.hidden,
        );
        windowManager.waitUntilReadyToShow(windowOptions, () async {
          await windowManager.show();
          await windowManager.focus();
          await Window.setEffect(
              effect: WindowEffect.acrylic,
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
    return StreamBuilder<ThemeMode>(
        stream: themeMode.stream,
        builder: (context, snapshot) {
          var theme = snapshot.data ?? ThemeMode.dark;
          var surfaceColor =
              theme == ThemeMode.dark ? Colors.grey[850] : Colors.grey[300];
          var textColor = theme == ThemeMode.dark ? Colors.white : Colors.black;

          return Column(
            children: [
              TitleBar(
                title: PaddingLeft(
                  padding: 10,
                  child: Text("Utility Master",
                      style: TextStyle(color: textColor)),
                ),
                leading:
                    const TickingIcon(icon: Icons.hexagon_outlined, size: 25),
                surfaceColor: surfaceColor,
                theme: Platform.isWindows
                    ? PlatformTheme.windows
                    : PlatformTheme.mac,
                color: surfaceColor,
                isMaximized: windowManager.isMaximized,
                onMaximize: windowManager.maximize,
                onMinimize: windowManager.minimize,
                onStartDragging: windowManager.startDragging,
                onUnMaximize: windowManager.unmaximize,
              ),
              Expanded(
                child: child,
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) => injectTitleBar(MultiBlocProvider(
      providers: svc<BlocService>().onRegisterProviders().toList(),
      child: themeMode.unique.buildNullable((t) => ShadApp.materialRouter(
            debugShowCheckedModeBanner: false,
            themeMode: t ?? ThemeMode.dark,
            darkTheme: ShadThemeData(
              brightness: Brightness.dark,
              colorScheme: MonochromeShadSlateColorScheme.dark(
                background: const Color(0xff000000).withOpacity(0.1),
              ),
            ),
            theme: ShadThemeData(
              brightness: Brightness.light,
              colorScheme: MonochromeShadSlateColorScheme.light(
                background: const Color(0xfff0f0f0).withOpacity(0.1),
              ),
            ),
            title: "Utility Master",
            routerConfig: router,
          ))));
}
