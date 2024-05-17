// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'settings.dart';

class UserSettingsMapper extends ClassMapperBase<UserSettings> {
  UserSettingsMapper._();

  static UserSettingsMapper? _instance;
  static UserSettingsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserSettingsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UserSettings';

  static String _$themeMode(UserSettings v) => v.themeMode;
  static const Field<UserSettings, String> _f$themeMode =
      Field('themeMode', _$themeMode, opt: true, def: "dark");
  static String _$windowEffect(UserSettings v) => v.windowEffect;
  static const Field<UserSettings, String> _f$windowEffect =
      Field('windowEffect', _$windowEffect, opt: true, def: "solid");
  static double _$themeOpacity(UserSettings v) => v.themeOpacity;
  static const Field<UserSettings, double> _f$themeOpacity =
      Field('themeOpacity', _$themeOpacity, opt: true, def: 1.0);
  static String? _$uid(UserSettings v) => v.uid;
  static const Field<UserSettings, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static bool? _$exists(UserSettings v) => v.exists;
  static const Field<UserSettings, bool> _f$exists =
      Field('exists', _$exists, mode: FieldMode.member);

  @override
  final MappableFields<UserSettings> fields = const {
    #themeMode: _f$themeMode,
    #windowEffect: _f$windowEffect,
    #themeOpacity: _f$themeOpacity,
    #uid: _f$uid,
    #exists: _f$exists,
  };

  static UserSettings _instantiate(DecodingData data) {
    return UserSettings(
        themeMode: data.dec(_f$themeMode),
        windowEffect: data.dec(_f$windowEffect),
        themeOpacity: data.dec(_f$themeOpacity));
  }

  @override
  final Function instantiate = _instantiate;

  static UserSettings fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserSettings>(map);
  }

  static UserSettings fromJson(String json) {
    return ensureInitialized().decodeJson<UserSettings>(json);
  }
}

mixin UserSettingsMappable {
  String toJson() {
    return UserSettingsMapper.ensureInitialized()
        .encodeJson<UserSettings>(this as UserSettings);
  }

  Map<String, dynamic> toMap() {
    return UserSettingsMapper.ensureInitialized()
        .encodeMap<UserSettings>(this as UserSettings);
  }

  UserSettingsCopyWith<UserSettings, UserSettings, UserSettings> get copyWith =>
      _UserSettingsCopyWithImpl(this as UserSettings, $identity, $identity);
  @override
  String toString() {
    return UserSettingsMapper.ensureInitialized()
        .stringifyValue(this as UserSettings);
  }

  @override
  bool operator ==(Object other) {
    return UserSettingsMapper.ensureInitialized()
        .equalsValue(this as UserSettings, other);
  }

  @override
  int get hashCode {
    return UserSettingsMapper.ensureInitialized()
        .hashValue(this as UserSettings);
  }
}

extension UserSettingsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserSettings, $Out> {
  UserSettingsCopyWith<$R, UserSettings, $Out> get $asUserSettings =>
      $base.as((v, t, t2) => _UserSettingsCopyWithImpl(v, t, t2));
}

abstract class UserSettingsCopyWith<$R, $In extends UserSettings, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? themeMode, String? windowEffect, double? themeOpacity});
  UserSettingsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserSettingsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserSettings, $Out>
    implements UserSettingsCopyWith<$R, UserSettings, $Out> {
  _UserSettingsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserSettings> $mapper =
      UserSettingsMapper.ensureInitialized();
  @override
  $R call({String? themeMode, String? windowEffect, double? themeOpacity}) =>
      $apply(FieldCopyWithData({
        if (themeMode != null) #themeMode: themeMode,
        if (windowEffect != null) #windowEffect: windowEffect,
        if (themeOpacity != null) #themeOpacity: themeOpacity
      }));
  @override
  UserSettings $make(CopyWithData data) => UserSettings(
      themeMode: data.get(#themeMode, or: $value.themeMode),
      windowEffect: data.get(#windowEffect, or: $value.windowEffect),
      themeOpacity: data.get(#themeOpacity, or: $value.themeOpacity));

  @override
  UserSettingsCopyWith<$R2, UserSettings, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserSettingsCopyWithImpl($value, $cast, t);
}
