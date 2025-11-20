import 'package:dio/dio.dart';
import 'app_dio.dart';

class NetworkModule {
  static Dio provideDio() {
    return AppDio.instance;
  }

  static void configureDio() {}
}
