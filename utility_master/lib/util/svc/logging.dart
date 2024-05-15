import 'package:fast_log/fast_log.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:serviced/serviced.dart';

Stream<FlutterErrorDetails> get streamErrors => services().get<LoggingService>()._errorStream!.stream;

class LoggingService extends Service {
  BehaviorSubject<FlutterErrorDetails>? _errorStream;

  @override
  void onStart() {
    // Configure talker logging instance
    _errorStream = BehaviorSubject<FlutterErrorDetails>();

    // Configure fast_log package to route to talker
    lDebugMode = true;
    FlutterError.onError = (d) => _errorStream!.add(d);
  }

  void onError(Object e, StackTrace stack) {
    error(e);
    error(stack);
  }

  @override
  void onStop() {
    _errorStream!.close();
  }
}
