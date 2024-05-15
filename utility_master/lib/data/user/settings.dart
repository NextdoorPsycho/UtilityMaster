import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:flutter_acrylic/window_effect.dart';

part 'settings.mapper.dart';

@MappableClass()
class UserSettings with UserSettingsMappable {
  String themeMode;
  WindowEffect windowEffect;
  double appOpacity;
  String? uid;
  bool? exists;

  UserSettings({
    this.themeMode = "dark", // "dark", "light", "system"
    this.windowEffect = WindowEffect
        .solid, // "transparent", "disabled", "solid", "aero", "acrylic", "mica"
    this.appOpacity = 1.0,
  });

  void toggleTheme() {
    themeMode = themeMode == "dark" ? "light" : "dark";
  }

  ThemeMode get themeModeEnum {
    switch (themeMode) {
      case "dark":
        return ThemeMode.dark;
      case "light":
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }

  WindowEffect get windowEffectEnum {
    switch (windowEffect) {
      case WindowEffect.transparent:
        return WindowEffect.transparent;
      case WindowEffect.disabled:
        return WindowEffect.disabled;
      case WindowEffect.solid:
        return WindowEffect.solid;
      case WindowEffect.aero:
        return WindowEffect.aero;
      case WindowEffect.acrylic:
        return WindowEffect.acrylic;
      case WindowEffect.mica:
        return WindowEffect.mica;
      default:
        return WindowEffect.solid;
    }
  }

  double get appOpacityRounded {
    return (appOpacity * 100).round() / 100;
  }

  void setThemeMode(ThemeMode mode) {
    themeMode = mode.name;
  }

  void setWindowEffect(WindowEffect effect) {
    windowEffect = effect;
  }

  void setAppOpacity(double opacity) {
    appOpacity = opacity;
  }
}
