import 'dart:developer' as developer;
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

class AppLogger {
  /// Logs a message to developer console in debug mode and to Crashlytics in release mode.
  static void log(String message, {String name = 'App'}) {
    if (kDebugMode) {
      developer.log(message, name: name);
    } else {
      FirebaseCrashlytics.instance.log('[$name] $message');
    }
  }

  /// Logs an error to developer console in debug mode and records it in Crashlytics.
  static void error(String message, [Object? error, StackTrace? stackTrace]) {
    if (kDebugMode) {
      developer.log(
        message,
        name: 'Error',
        error: error,
        stackTrace: stackTrace,
      );
    } else {
      FirebaseCrashlytics.instance.recordError(
        error ?? message,
        stackTrace,
        reason: message,
      );
    }
  }
}
