import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class Failure {
  final String errorMessage;

  Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});
  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
            errorMessage: 'The connection has timed out Please Try again');
      case DioExceptionType.sendTimeout:
        return ServerFailure(
            errorMessage: 'The sending has timed out Please Try again');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
            errorMessage: 'The reciveing has timed out Please Try again');
      case DioExceptionType.badCertificate:
        return ServerFailure(
            errorMessage: 'The connection has badCertificate Please Try again');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(e.response!.statusCode!, e.response);
      case DioExceptionType.cancel:
        return ServerFailure(
            errorMessage: 'The connection has canceled Please Try again');
      case DioExceptionType.connectionError:
        return ServerFailure(
            errorMessage: 'There is a connection error please try again');
      case DioExceptionType.unknown:
        return ServerFailure(
            errorMessage: 'Oops there is an error please try again');
    }
  }

  factory ServerFailure.fromResponse(int statuesCode, dynamic response) {
    if (statuesCode == 500) {
      return ServerFailure(
          errorMessage: 'There is error with Servers Please Try later');
    }
    if (statuesCode == 404) {
      return ServerFailure(
          errorMessage: 'The request is not found please try again');
    }
    if (statuesCode == 400 || statuesCode == 401 || statuesCode == 403) {
      return ServerFailure(
        errorMessage: response["status_message"],
      );
    }
    return ServerFailure(errorMessage: 'Threr was an error');
  }
}

class FireBaseFailure extends Failure {
  FireBaseFailure({required super.errorMessage});
  factory FireBaseFailure.fromAuthException(FirebaseAuthException e) {
    if (e.code == '') {
      return FireBaseFailure(errorMessage: 'Please Use a Method to Sign Up');
    }
    if (e.code == 'weak-password') {
      return FireBaseFailure(errorMessage: 'Too weak Passowrd');
    } else if (e.code == 'email-already-in-use') {
      return FireBaseFailure(
          errorMessage: 'The account already exists for that email.  ');
    }
    if (e.code == 'user-not-found') {
      FireBaseFailure(errorMessage: 'No user found for that email.');
    } else if (e.code == 'wrong-password') {
      FireBaseFailure(errorMessage: 'Wrong password provided for that user.');
    }
    return FireBaseFailure(errorMessage: e.toString());
  }
}
