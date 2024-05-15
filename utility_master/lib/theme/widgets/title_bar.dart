import 'package:flutter/material.dart';
import 'package:titlebar_buttons/titlebar_buttons.dart';
import 'package:universal_io/io.dart';
import 'package:window_manager/window_manager.dart';

class TitleBar extends StatelessWidget {
  final PlatformTheme? theme;
  final Widget? leading;
  final Widget title;
  final Color? color;
  final Color? surfaceColor;

  const TitleBar(
      {super.key,
      this.leading,
      required this.title,
      this.theme,
      this.color,
      this.surfaceColor});

  @override
  Widget build(BuildContext context) {
    PlatformTheme type = theme ?? _defaultPlatformTheme;
    Color bg = color ?? Colors.black.withOpacity(0.95);
    Color surface = surfaceColor ?? Colors.white70;

    return Directionality(
        textDirection: TextDirection.ltr,
        child: GestureDetector(
          onPanStart: (dsd) => windowManager.startDragging(),
          child: Container(
            decoration: BoxDecoration(color: color),
            child: Padding(
              padding: const EdgeInsets.only(left: 7, top: 4, bottom: 4),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: switch (type) {
                  PlatformTheme.windows => [
                      if (leading != null) leading!,
                      title,
                      const Spacer(),
                      TitleBarButtons(
                        color: surface,
                        theme: type,
                      )
                    ],
                  PlatformTheme.mac => [
                      Expanded(
                          child: TitleBarButtons(
                        color: surface,
                        theme: type,
                      )),
                      if (leading != null) leading!,
                      title,
                      const Spacer(),
                    ]
                },
              ),
            ),
          ),
        ));
  }
}

class TitleBarButtons extends StatelessWidget {
  final Color color;
  final PlatformTheme? theme;

  const TitleBarButtons({super.key, this.theme, required this.color});

  @override
  Widget build(BuildContext context) {
    PlatformTheme type = theme ?? _defaultPlatformTheme;

    List<Widget> w = [
      DecoratedMinimizeButton(
          type: type.toThemeType(), onPressed: () => windowManager.minimize()),
      DecoratedMaximizeButton(
          type: type.toThemeType(),
          onPressed: () => windowManager.isMaximized().then((value) =>
              value ? windowManager.unmaximize() : windowManager.maximize())),
      DecoratedCloseButton(
          type: type.toThemeType(), onPressed: () => windowManager.close()),
    ];

    Widget r = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: switch (type) {
        PlatformTheme.windows => [w[0], w[1], w[2]],
        PlatformTheme.mac => [w[2], w[0], w[1]],
      },
    );

    return type.isColorFiltered
        ? ColorFiltered(
            colorFilter: ColorFilter.mode(color, BlendMode.srcATop),
            child: r,
          )
        : r;
  }
}

PlatformTheme get _defaultPlatformTheme => Platform.isWindows
    ? PlatformTheme.windows
    : Platform.isMacOS
        ? PlatformTheme.mac
        : PlatformTheme.windows;

enum PlatformTheme { windows, mac }

extension XPlatformTheme on PlatformTheme {
  ThemeType toThemeType() {
    switch (this) {
      case PlatformTheme.windows:
        return ThemeType.auto;
      case PlatformTheme.mac:
        return ThemeType.osxArc;
    }

    return ThemeType.adwaita;
  }

  bool get isColorFiltered => this == PlatformTheme.windows;

  bool get isReversed => this == PlatformTheme.mac;
}
