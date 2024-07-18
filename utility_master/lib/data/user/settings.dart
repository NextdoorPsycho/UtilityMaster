import 'package:dart_mappable/dart_mappable.dart';

part 'settings.mapper.dart';

@MappableClass()
class UserSettings with UserSettingsMappable {
  final bool developing;
  String? uid;
  bool? exists;

  UserSettings({
    this.developing = false,
  });
}
