// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'user.dart';

class UserMapper extends ClassMapperBase<User> {
  UserMapper._();

  static UserMapper? _instance;
  static UserMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'User';

  static String _$firstName(User v) => v.firstName;
  static const Field<User, String> _f$firstName =
      Field('firstName', _$firstName);
  static String _$lastName(User v) => v.lastName;
  static const Field<User, String> _f$lastName = Field('lastName', _$lastName);
  static String _$email(User v) => v.email;
  static const Field<User, String> _f$email = Field('email', _$email);
  static String? _$uid(User v) => v.uid;
  static const Field<User, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static bool? _$exists(User v) => v.exists;
  static const Field<User, bool> _f$exists =
      Field('exists', _$exists, mode: FieldMode.member);

  @override
  final MappableFields<User> fields = const {
    #firstName: _f$firstName,
    #lastName: _f$lastName,
    #email: _f$email,
    #uid: _f$uid,
    #exists: _f$exists,
  };

  static User _instantiate(DecodingData data) {
    return User(
        firstName: data.dec(_f$firstName),
        lastName: data.dec(_f$lastName),
        email: data.dec(_f$email));
  }

  @override
  final Function instantiate = _instantiate;

  static User fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<User>(map);
  }

  static User fromJson(String json) {
    return ensureInitialized().decodeJson<User>(json);
  }
}

mixin UserMappable {
  String toJson() {
    return UserMapper.ensureInitialized().encodeJson<User>(this as User);
  }

  Map<String, dynamic> toMap() {
    return UserMapper.ensureInitialized().encodeMap<User>(this as User);
  }

  UserCopyWith<User, User, User> get copyWith =>
      _UserCopyWithImpl(this as User, $identity, $identity);
  @override
  String toString() {
    return UserMapper.ensureInitialized().stringifyValue(this as User);
  }

  @override
  bool operator ==(Object other) {
    return UserMapper.ensureInitialized().equalsValue(this as User, other);
  }

  @override
  int get hashCode {
    return UserMapper.ensureInitialized().hashValue(this as User);
  }
}

extension UserValueCopy<$R, $Out> on ObjectCopyWith<$R, User, $Out> {
  UserCopyWith<$R, User, $Out> get $asUser =>
      $base.as((v, t, t2) => _UserCopyWithImpl(v, t, t2));
}

abstract class UserCopyWith<$R, $In extends User, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? firstName, String? lastName, String? email});
  UserCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, User, $Out>
    implements UserCopyWith<$R, User, $Out> {
  _UserCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<User> $mapper = UserMapper.ensureInitialized();
  @override
  $R call({String? firstName, String? lastName, String? email}) =>
      $apply(FieldCopyWithData({
        if (firstName != null) #firstName: firstName,
        if (lastName != null) #lastName: lastName,
        if (email != null) #email: email
      }));
  @override
  User $make(CopyWithData data) => User(
      firstName: data.get(#firstName, or: $value.firstName),
      lastName: data.get(#lastName, or: $value.lastName),
      email: data.get(#email, or: $value.email));

  @override
  UserCopyWith<$R2, User, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _UserCopyWithImpl($value, $cast, t);
}
