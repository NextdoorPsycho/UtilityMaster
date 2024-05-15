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
      child: themeMode.unique.buildNullable((t) =>
          themeOpacity.unique.buildNullable((o) => ShadApp.materialRouter(
                debugShowCheckedModeBanner: false,
                themeMode: t ?? ThemeMode.system,
                darkTheme: ShadThemeData(
                  brightness: Brightness.dark,
                  colorScheme: MonochromeShadSlateColorScheme.dark(
                    background: const Color(0xff000000).withOpacity(o ?? 1.0),
                    foreground: const Color(0xfff8fafc).withOpacity(o ?? 1.0),
                    card: const Color(0xff1a1a1a).withOpacity(o ?? 1.0),
                    cardForeground:
                        const Color(0xfff8fafc).withOpacity(o ?? 1.0),
                    popover: const Color(0xff1a1a1a).withOpacity(o ?? 1.0),
                    popoverForeground:
                        const Color(0xfff8fafc).withOpacity(o ?? 1.0),
                    primary: const Color(0xfff8fafc).withOpacity(o ?? 1.0),
                    primaryForeground:
                        const Color(0xff2b2b2b).withOpacity(o ?? 1.0),
                    secondary: const Color(0xff404040).withOpacity(o ?? 1.0),
                    secondaryForeground:
                        const Color(0xfff8fafc).withOpacity(o ?? 1.0),
                    muted: const Color(0xff555555).withOpacity(o ?? 1.0),
                    mutedForeground:
                        const Color(0xffe0e0e0).withOpacity(o ?? 1.0),
                    accent: const Color(0xff404040).withOpacity(o ?? 1.0),
                    accentForeground:
                        const Color(0xfff8fafc).withOpacity(o ?? 1.0),
                    destructive: const Color(0xff851515).withOpacity(o ?? 1.0),
                    destructiveForeground:
                        const Color(0xfff8fafc).withOpacity(o ?? 1.0),
                    border: const Color(0xff404040).withOpacity(o ?? 1.0),
                    input: const Color(0xff404040).withOpacity(o ?? 1.0),
                    ring: const Color(0xffa0a0a0).withOpacity(o ?? 1.0),
                    selection: const Color(0xff444444).withOpacity(o ?? 1.0),
                  ),
                ),
                theme: ShadThemeData(
                  brightness: Brightness.light,
                  colorScheme: MonochromeShadSlateColorScheme.light(
                    background: const Color(0xfff0f0f0).withOpacity(o ?? 1.0),
                    foreground: const Color(0xff090909).withOpacity(o ?? 1.0),
                    card: const Color(0xffffffff).withOpacity(o ?? 1.0),
                    cardForeground:
                        const Color(0xff2b2b2b).withOpacity(o ?? 1.0),
                    popover: const Color(0xffffffff).withOpacity(o ?? 1.0),
                    popoverForeground:
                        const Color(0xff2b2b2b).withOpacity(o ?? 1.0),
                    primary: const Color(0xff333333).withOpacity(o ?? 1.0),
                    primaryForeground:
                        const Color(0xffe5e6ea).withOpacity(o ?? 1.0),
                    secondary: const Color(0xffe0e0e0).withOpacity(o ?? 1.0),
                    secondaryForeground:
                        const Color(0xff333333).withOpacity(o ?? 1.0),
                    muted: const Color(0xffd1d1d1).withOpacity(o ?? 1.0),
                    mutedForeground:
                        const Color(0xff555555).withOpacity(o ?? 1.0),
                    accent: const Color(0xffcccccc).withOpacity(o ?? 1.0),
                    accentForeground:
                        const Color(0xff1a1a1a).withOpacity(o ?? 1.0),
                    destructive: const Color(0xffd01717).withOpacity(o ?? 1.0),
                    destructiveForeground:
                        const Color(0xfff8fafc).withOpacity(o ?? 1.0),
                    border: const Color(0xffc0c0c0).withOpacity(o ?? 1.0),
                    input: const Color(0xffe0e0e0).withOpacity(o ?? 1.0),
                    ring: const Color(0xff2b2b2b).withOpacity(o ?? 1.0),
                    selection: const Color(0xffa0a0a0).withOpacity(o ?? 1.0),
                  ),
                ),
                title: "Utility Master",
                routerConfig: router,
              )))));
}
