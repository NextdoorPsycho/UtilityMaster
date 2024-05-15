import 'package:dart_mappable/dart_mappable.dart';

part 'user_settings.mapper.dart';

@MappableClass()
class UserSettings with UserSettingsMappable {
  String themeMode;
  String? uid;
  bool? exists;

  UserSettings({
    this.themeMode = "system",
  });

  void toggleTheme() {
    themeMode = themeMode == "system" ? "light" : "system";
  }
}
