// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for android - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDSkFIQhj9LASg9QgljTvMeJf6LTBEJ0G8',
    appId: '1:809958656651:web:d895c2a89c2a56dc43e28e',
    messagingSenderId: '809958656651',
    projectId: 'arcaneutilitymaster',
    authDomain: 'arcaneutilitymaster.firebaseapp.com',
    databaseURL: 'https://arcaneutilitymaster-default-rtdb.firebaseio.com',
    storageBucket: 'arcaneutilitymaster.appspot.com',
    measurementId: 'G-TJ1J6TES8G',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCfN5_mZflkD39V3I2XXLtvtMigOysmAWE',
    appId: '1:809958656651:ios:3d84a4cabab8e7a343e28e',
    messagingSenderId: '809958656651',
    projectId: 'arcaneutilitymaster',
    databaseURL: 'https://arcaneutilitymaster-default-rtdb.firebaseio.com',
    storageBucket: 'arcaneutilitymaster.appspot.com',
    iosBundleId: 'art.arcane.utilityMaster',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDSkFIQhj9LASg9QgljTvMeJf6LTBEJ0G8',
    appId: '1:809958656651:web:68252d70767189d543e28e',
    messagingSenderId: '809958656651',
    projectId: 'arcaneutilitymaster',
    authDomain: 'arcaneutilitymaster.firebaseapp.com',
    databaseURL: 'https://arcaneutilitymaster-default-rtdb.firebaseio.com',
    storageBucket: 'arcaneutilitymaster.appspot.com',
    measurementId: 'G-C07S01W0RG',
  );

}