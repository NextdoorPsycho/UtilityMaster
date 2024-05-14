import 'package:dart_mappable/dart_mappable.dart';
import 'package:utility_master/data/admin/app_user_restricted.dart';

part 'app_user.mapper.dart';

@MappableClass()
class AppUser with AppUserMappable {
  String? id;
  bool theme;

  AppUser({
    this.theme = false,
  });

  //Theme shit
  //toggle theme
  void toggleTheme() {
    theme = !theme;
  }

  //get current
  bool getCurrentTheme() {
    return theme;
  }

  //Restricted Shit
  //check if the user is an admin
}
