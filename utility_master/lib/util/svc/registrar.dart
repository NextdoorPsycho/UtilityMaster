import 'package:serviced/serviced.dart';
import 'package:utility_master/util/bloc/bloc.dart';
import 'package:utility_master/util/svc/firebase.dart';
import 'package:utility_master/util/svc/hive.dart';
import 'package:utility_master/util/svc/logging.dart';
import 'package:utility_master/util/svc/login.dart';
import 'package:utility_master/util/svc/user.dart';
import 'package:utility_master/util/svc/widget_binding.dart';

Future<void> registerServices() async {
  services().register<WidgetsBindingService>(() => WidgetsBindingService(),
      lazy: false);
  services().register<FirebaseService>(() => FirebaseService(), lazy: false);
  services().register<BlocService>(() => BlocService(), lazy: false);
  services().register<UserService>(() => UserService(), lazy: true);
  services().register<LoginService>(() => LoginService(), lazy: true);
  services().register<HiveService>(() => HiveService(), lazy: false);
  services().register<LoggingService>(() => LoggingService(), lazy: false);
  await services().waitForStartup();
}
