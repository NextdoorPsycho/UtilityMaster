import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/color_scheme/base.dart';

@immutable
class MonochromeShadSlateColorScheme extends ShadColorScheme {
  const MonochromeShadSlateColorScheme(
      {required super.background,
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
      required super.selection});

  const MonochromeShadSlateColorScheme.light({
    super.background = const Color(0xfff0f0f0),
    super.foreground = const Color(0xff090909),
    super.card = const Color(0xffffffff),
    super.cardForeground = const Color(0xff2b2b2b),
    super.popover = const Color(0xffffffff),
    super.popoverForeground = const Color(0xff2b2b2b),
    super.primary = const Color(0xff333333),
    super.primaryForeground = const Color(0xffe5e6ea),
    super.secondary = const Color(0xffe0e0e0),
    super.secondaryForeground = const Color(0xff333333),
    super.muted = const Color(0xffd1d1d1),
    super.mutedForeground = const Color(0xff555555),
    super.accent = const Color(0xffcccccc),
    super.accentForeground = const Color(0xff1a1a1a),
    super.destructive = const Color(0xffd01717),
    super.destructiveForeground = const Color(0xfff8fafc),
    super.border = const Color(0xffc0c0c0),
    super.input = const Color(0xffe0e0e0),
    super.ring = const Color(0xff2b2b2b),
    super.selection = const Color(0xffa0a0a0),
  });

  const MonochromeShadSlateColorScheme.dark({
    super.background = const Color(0xff000000),
    super.foreground = const Color(0xfff8fafc),
    super.card = const Color(0xff1a1a1a),
    super.cardForeground = const Color(0xfff8fafc),
    super.popover = const Color(0xff1a1a1a),
    super.popoverForeground = const Color(0xfff8fafc),
    super.primary = const Color(0xfff8fafc),
    super.primaryForeground = const Color(0xff2b2b2b),
    super.secondary = const Color(0xff404040),
    super.secondaryForeground = const Color(0xfff8fafc),
    super.muted = const Color(0xff555555),
    super.mutedForeground = const Color(0xffe0e0e0),
    super.accent = const Color(0xff404040),
    super.accentForeground = const Color(0xfff8fafc),
    super.destructive = const Color(0xff851515),
    super.destructiveForeground = const Color(0xfff8fafc),
    super.border = const Color(0xff404040),
    super.input = const Color(0xff404040),
    super.ring = const Color(0xffa0a0a0),
    super.selection = const Color(0xff444444),
  });
}
