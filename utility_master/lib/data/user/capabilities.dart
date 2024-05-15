import 'package:dart_mappable/dart_mappable.dart';

part 'capabilities.mapper.dart';

// We need to tell mappable what types this is a superclass of for it to work
@MappableClass()
class UserCapabilities with UserCapabilitiesMappable {
  final bool admin;
  String? uid;
  bool? exists;

  UserCapabilities({
    this.admin = false,
  });
}
