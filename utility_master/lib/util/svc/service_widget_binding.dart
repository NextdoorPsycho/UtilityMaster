import 'package:fast_log/fast_log.dart';
import 'package:flutter/material.dart';
import 'package:serviced/serviced.dart';

class WidgetsBindingService extends Service {
  late WidgetsBinding binding;

  @override
  void onStart() {
    binding = WidgetsFlutterBinding.ensureInitialized();
    // FlutterNativeSplash.preserve(widgetsBinding: binding);
    verbose("Got Binding");
  }

  void dropSplash() {
    verbose("Dropped splash");
    // FlutterNativeSplash.remove();
  }

  @override
  void onStop() {}
}
