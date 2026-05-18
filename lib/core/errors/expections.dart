// lib/core/error/exceptions.dart

/// Exception thrown when there's an error with server/API operations
class ServerException implements Exception {
  final String message;

  ServerException([this.message = 'Server error occurred']);

  @override
  String toString() => 'ServerException: $message';
}

/// Exception thrown when there's an error with local cache/Hive operations
class CacheException implements Exception {
  final String message;

  CacheException([this.message = 'Cache error occurred']);

  @override
  String toString() => 'CacheException: $message';
}

/// Exception thrown when there's an error with Firebase operations
class FirebaseException implements Exception {
  final String message;

  FirebaseException([this.message = 'Firebase error occurred']);

  @override
  String toString() => 'FirebaseException: $message';
}

class CancelledException implements Exception {
  final String message;

  CancelledException([this.message = 'Request cancelled']);

  @override
  String toString() => 'CancelledException: $message';
}
