import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';

class AppLogger {
  /// Logs a message only in debug mode.
  static void log(String message, {String name = 'App'}) {
    if (kDebugMode) {
      developer.log(message, name: name);
    }
  }

  /// Logs an error only in debug mode.
  static void error(String message, [Object? error, StackTrace? stackTrace]) {
    if (kDebugMode) {
      developer.log(message, name: 'Error', error: error, stackTrace: stackTrace);
    }
  }
}
