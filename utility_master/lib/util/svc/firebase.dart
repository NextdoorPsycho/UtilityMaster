import 'package:firebase_core/firebase_core.dart';
import 'package:serviced/serviced.dart';
import 'package:utility_master/firebase_options.dart';

class FirebaseService extends StatelessService implements AsyncStartupTasked {
  @override
  Future<void> onStartupTask() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
