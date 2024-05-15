// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'capabilities.dart';

class UserCapabilitiesMapper extends ClassMapperBase<UserCapabilities> {
  UserCapabilitiesMapper._();

  static UserCapabilitiesMapper? _instance;
  static UserCapabilitiesMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserCapabilitiesMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UserCapabilities';

  static bool _$admin(UserCapabilities v) => v.admin;
  static const Field<UserCapabilities, bool> _f$admin =
      Field('admin', _$admin, opt: true, def: false);
  static String? _$uid(UserCapabilities v) => v.uid;
  static const Field<UserCapabilities, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static bool? _$exists(UserCapabilities v) => v.exists;
  static const Field<UserCapabilities, bool> _f$exists =
      Field('exists', _$exists, mode: FieldMode.member);

  @override
  final MappableFields<UserCapabilities> fields = const {
    #admin: _f$admin,
    #uid: _f$uid,
    #exists: _f$exists,
  };

  static UserCapabilities _instantiate(DecodingData data) {
    return UserCapabilities(admin: data.dec(_f$admin));
  }

  @override
  final Function instantiate = _instantiate;

  static UserCapabilities fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserCapabilities>(map);
  }

  static UserCapabilities fromJson(String json) {
    return ensureInitialized().decodeJson<UserCapabilities>(json);
  }
}

mixin UserCapabilitiesMappable {
  String toJson() {
    return UserCapabilitiesMapper.ensureInitialized()
        .encodeJson<UserCapabilities>(this as UserCapabilities);
  }

  Map<String, dynamic> toMap() {
    return UserCapabilitiesMapper.ensureInitialized()
        .encodeMap<UserCapabilities>(this as UserCapabilities);
  }

  UserCapabilitiesCopyWith<UserCapabilities, UserCapabilities, UserCapabilities>
      get copyWith => _UserCapabilitiesCopyWithImpl(
          this as UserCapabilities, $identity, $identity);
  @override
  String toString() {
    return UserCapabilitiesMapper.ensureInitialized()
        .stringifyValue(this as UserCapabilities);
  }

  @override
  bool operator ==(Object other) {
    return UserCapabilitiesMapper.ensureInitialized()
        .equalsValue(this as UserCapabilities, other);
  }

  @override
  int get hashCode {
    return UserCapabilitiesMapper.ensureInitialized()
        .hashValue(this as UserCapabilities);
  }
}

extension UserCapabilitiesValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserCapabilities, $Out> {
  UserCapabilitiesCopyWith<$R, UserCapabilities, $Out>
      get $asUserCapabilities =>
          $base.as((v, t, t2) => _UserCapabilitiesCopyWithImpl(v, t, t2));
}

abstract class UserCapabilitiesCopyWith<$R, $In extends UserCapabilities, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({bool? admin});
  UserCapabilitiesCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UserCapabilitiesCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserCapabilities, $Out>
    implements UserCapabilitiesCopyWith<$R, UserCapabilities, $Out> {
  _UserCapabilitiesCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserCapabilities> $mapper =
      UserCapabilitiesMapper.ensureInitialized();
  @override
  $R call({bool? admin}) =>
      $apply(FieldCopyWithData({if (admin != null) #admin: admin}));
  @override
  UserCapabilities $make(CopyWithData data) =>
      UserCapabilities(admin: data.get(#admin, or: $value.admin));

  @override
  UserCapabilitiesCopyWith<$R2, UserCapabilities, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserCapabilitiesCopyWithImpl($value, $cast, t);
}
