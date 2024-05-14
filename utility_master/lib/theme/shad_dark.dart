import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/color_scheme/base.dart';

@immutable
class MonochromeShadSlateColorScheme extends ShadColorScheme {
  MonochromeShadSlateColorScheme(
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
    super.background = const Color(0xfff0f0f0), // Light grey, softer than pure white
    super.foreground = const Color(0xff090909), // Dark grey, for strong contrast against background
    super.card = const Color(0xffffffff), // No change, maintains clean, sharp contrast
    super.cardForeground = const Color(0xff2b2b2b), // Darker grey to enhance readability
    super.popover = const Color(0xffffffff), // Keeps the background clean and neutral
    super.popoverForeground = const Color(0xff2b2b2b), // Ensures high contrast for readability
    super.primary = const Color(0xff333333), // Darker grey, stronger than the original deep blue
    super.primaryForeground = const Color(0xffe5e6ea), // No change, maintains high visibility
    super.secondary = const Color(0xffe0e0e0), // Lighter grey, provides subtle differentiation
    super.secondaryForeground = const Color(0xff333333), // Darker for better contrast
    super.muted = const Color(0xffd1d1d1), // Even lighter grey, less intense
    super.mutedForeground = const Color(0xff555555), // Medium grey, to ensure readability
    super.accent = const Color(0xffcccccc), // Mid-tone grey, stands out against most backgrounds
    super.accentForeground = const Color(0xff1a1a1a), // Dark grey, contrasts well with lighter accent color
    super.destructive = const Color(0xffd01717), // Grey with a hint of depth, differentiating it slightly
    super.destructiveForeground = const Color(0xfff8fafc), // No change, for legibility
    super.border = const Color(0xffc0c0c0), // Light grey, distinguishes edges subtly
    super.input = const Color(0xffe0e0e0), // Matches secondary for cohesive interaction areas
    super.ring = const Color(0xff2b2b2b), // Dark grey, visible and distinct
    super.selection = const Color(0xffa0a0a0), // Medium grey, stands out against both light and dark backgrounds
  });

  const MonochromeShadSlateColorScheme.dark({
    super.background = const Color(0xff000000),
    super.foreground = const Color(0xfff8fafc), // No change, already very light
    super.card = const Color(0xff1a1a1a), // Darker grey for deeper contrast
    super.cardForeground = const Color(0xfff8fafc), // No change, for high visibility
    super.popover = const Color(0xff1a1a1a), // Darker grey to match card
    super.popoverForeground = const Color(0xfff8fafc), // No change, ensures readability
    super.primary = const Color(0xfff8fafc), // No change, highlights primary actions
    super.primaryForeground = const Color(0xff2b2b2b), // Dark grey, provides contrast without harshness
    super.secondary = const Color(0xff404040), // Medium-dark grey, offers a step between primary and muted
    super.secondaryForeground = const Color(0xfff8fafc), // No change, maintains legibility
    super.muted = const Color(0xff555555), // Medium grey, less intense than secondary
    super.mutedForeground = const Color(0xffe0e0e0), // Light grey, ensures readability on muted background
    super.accent = const Color(0xff404040), // Matches secondary for a consistent thematic element
    super.accentForeground = const Color(0xfff8fafc), // No change, for clear visibility
    super.destructive = const Color(0xff851515), // Grey with a hint of depth, differentiating it slightly
    super.destructiveForeground = const Color(0xfff8fafc), // No change, highlights important actions
    super.border = const Color(0xff404040), // Consistent with secondary, delineates areas subtly
    super.input = const Color(0xff404040), // Matches secondary for consistency in interactive elements
    super.ring = const Color(0xffa0a0a0), // Lighter grey, stands out against other input elements
    super.selection = const Color(0xff444444), // Dark grey, distinct from other elements for focus
  });

  const MonochromeShadSlateColorScheme.vlight({
    super.background = const Color(0xffffffff),
    super.foreground = const Color(0xff020817),
    super.card = const Color(0xffffffff),
    super.cardForeground = const Color(0xff020817),
    super.popover = const Color(0xffffffff),
    super.popoverForeground = const Color(0xff020817),
    super.primary = const Color(0xff0f172a),
    super.primaryForeground = const Color(0xfff8fafc),
    super.secondary = const Color(0xfff1f5f9),
    super.secondaryForeground = const Color(0xff0f172a),
    super.muted = const Color(0xfff1f5f9),
    super.mutedForeground = const Color(0xff64748b),
    super.accent = const Color(0xfff1f5f9),
    super.accentForeground = const Color(0xff0f172a),
    super.destructive = const Color(0xffef4444),
    super.destructiveForeground = const Color(0xfff8fafc),
    super.border = const Color(0xffe2e8f0),
    super.input = const Color(0xffe2e8f0),
    super.ring = const Color(0xff020817),
    super.selection = const Color(0xFFB4D7FF),
  });

  const MonochromeShadSlateColorScheme.vdark({
    super.background = const Color(0xff020817),
    super.foreground = const Color(0xfff8fafc),
    super.card = const Color(0xff020817),
    super.cardForeground = const Color(0xfff8fafc),
    super.popover = const Color(0xff020817),
    super.popoverForeground = const Color(0xfff8fafc),
    super.primary = const Color(0xfff8fafc),
    super.primaryForeground = const Color(0xff0f172a),
    super.secondary = const Color(0xff1e293b),
    super.secondaryForeground = const Color(0xfff8fafc),
    super.muted = const Color(0xff1e293b),
    super.mutedForeground = const Color(0xff94a3b8),
    super.accent = const Color(0xff1e293b),
    super.accentForeground = const Color(0xfff8fafc),
    super.destructive = const Color(0xff7f1d1d),
    super.destructiveForeground = const Color(0xfff8fafc),
    super.border = const Color(0xff1e293b),
    super.input = const Color(0xff1e293b),
    super.ring = const Color(0xffcbd5e1),
    super.selection = const Color(0xFF355172),
  });
}
