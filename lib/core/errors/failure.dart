import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movify/core/errors/expections.dart';

abstract class Failure extends Equatable {
  final String errorMessage;

  const Failure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class ServerFailure extends Failure {
  const ServerFailure({required super.errorMessage});
  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.cancel:
        return const ServerFailure(
          errorMessage: 'The connection has canceled Please Try again',
        );
      case DioExceptionType.connectionTimeout:
        return const ServerFailure(
          errorMessage: 'The connection has timed out Please Try again',
        );
      case DioExceptionType.sendTimeout:
        return const ServerFailure(
          errorMessage: 'The sending has timed out Please Try again',
        );
      case DioExceptionType.receiveTimeout:
        return const ServerFailure(
          errorMessage: 'The reciveing has timed out Please Try again',
        );
      case DioExceptionType.badCertificate:
        return const ServerFailure(
          errorMessage: 'The connection has badCertificate Please Try again',
        );
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(e.response!.statusCode!, e.response);

      case DioExceptionType.connectionError:
        return const ServerFailure(
          errorMessage: 'There is a connection error please try again',
        );

      case DioExceptionType.unknown:
        return const ServerFailure(
          errorMessage: 'Oops there is an error please try again',
        );
      case DioExceptionType.transformTimeout:
        return const ServerFailure(
          errorMessage: 'Oops something went wrong please try again',
        );
    }
  }

  factory ServerFailure.fromResponse(int statuesCode, dynamic response) {
    if (statuesCode == 500) {
      return const ServerFailure(
        errorMessage: 'There is error with Servers Please Try later',
      );
    }
    if (statuesCode == 404) {
      return const ServerFailure(
        errorMessage: 'The request is not found please try again',
      );
    }
    if (statuesCode == 400 || statuesCode == 401 || statuesCode == 403) {
      return ServerFailure(errorMessage: response["status_message"] as String);
    }
    return const ServerFailure(errorMessage: 'Threr was an error');
  }
}

class FireBaseFailure extends Failure {
  const FireBaseFailure({required super.errorMessage});
  factory FireBaseFailure.fromAuthException(FirebaseAuthException e) {
    if (e.code == '') {
      return const FireBaseFailure(
        errorMessage: 'Please Use a Method to Sign Up',
      );
    }
    if (e.code == 'weak-password') {
      return const FireBaseFailure(errorMessage: 'Too weak Passowrd');
    } else if (e.code == 'email-already-in-use') {
      return const FireBaseFailure(
        errorMessage: 'The account already exists for that email.  ',
      );
    }
    if (e.code == 'user-not-found') {
      const FireBaseFailure(errorMessage: 'No user found for that email.');
    } else if (e.code == 'wrong-password') {
      const FireBaseFailure(
        errorMessage: 'Wrong password provided for that user.',
      );
    }
    return FireBaseFailure(errorMessage: e.toString());
  }
}

class CacheFailure extends Failure {
  const CacheFailure({required super.errorMessage});

  // Optional: Create from CacheException
  factory CacheFailure.fromException(CacheException e) =>
      CacheFailure(errorMessage: e.message);
}

class CancelledFailure extends Failure {
  const CancelledFailure() : super(errorMessage: 'cancelled');
}
