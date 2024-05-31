import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/color_scheme/base.dart';

@immutable
class MonochromeShadSlateColorScheme extends ShadColorScheme {
  const MonochromeShadSlateColorScheme({
    required super.background,
    required super.foreground,
    required super.card,
    required super.cardForeground,
    required super.popover,
    required super.popoverForeground,
    required super.primary,
    required super.primaryForeground,
    required super.secondary,
    required super.secondaryForeground,
    required super.muted,
    required super.mutedForeground,
    required super.accent,
    required super.accentForeground,
    required super.destructive,
    required super.destructiveForeground,
    required super.border,
    required super.input,
    required super.ring,
    required super.selection,
  });

  MonochromeShadSlateColorScheme.red()
      : super(
          background: const Color(0xff000000).withOpacity(0.5),
          foreground: const Color(0xfff8fafc),
          card: const Color(0xff1a1a1a).withOpacity(0.5),
          cardForeground: const Color(0xfff8fafc).withOpacity(0.5),
          popover: const Color(0xff1a1a1a),
          popoverForeground: const Color(0xfff8fafc),
          primary: const Color(0xfff8fafc),
          primaryForeground: const Color(0xff2b2b2b),
          secondary: const Color(0xff404040),
          secondaryForeground: const Color(0xfff8fafc),
          muted: const Color(0xff555555),
          mutedForeground: const Color(0xffe0e0e0),
          accent: const Color(0xff404040),
          accentForeground: const Color(0xfff8fafc),
          destructive: const Color(0xff851515),
          destructiveForeground: const Color(0xfff8fafc),
          border: const Color(0xff404040),
          input: const Color(0xff404040),
          ring: const Color(0xff3a0404),
          selection: const Color(0xff444444),
        );

  MonochromeShadSlateColorScheme.blue()
      : super(
          background: const Color(0xff000000).withOpacity(0.5),
          foreground: const Color(0xfff8fafc),
          card: const Color(0xff1a1a1a).withOpacity(0.5),
          cardForeground: const Color(0xfff8fafc).withOpacity(0.5),
          popover: const Color(0xff1a1a1a),
          popoverForeground: const Color(0xfff8fafc),
          primary: const Color(0xfff8fafc),
          primaryForeground: const Color(0xff2b2b2b),
          secondary: const Color(0xff404040),
          secondaryForeground: const Color(0xfff8fafc),
          muted: const Color(0xff555555),
          mutedForeground: const Color(0xffe0e0e0),
          accent: const Color(0xff404040),
          accentForeground: const Color(0xfff8fafc),
          destructive: const Color(0xff851515),
          destructiveForeground: const Color(0xfff8fafc),
          border: const Color(0xff404040),
          input: const Color(0xff404040),
          ring: const Color(0xff0d043a),
          selection: const Color(0xff444444),
        );
}
