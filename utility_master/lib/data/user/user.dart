import 'package:dart_mappable/dart_mappable.dart';

part 'user.mapper.dart';

@MappableClass()
class User with UserMappable {
  final String firstName;
  final String lastName;
  final String email;
  String? uid;
  bool? exists;

  User({required this.firstName, required this.lastName, required this.email});
}
