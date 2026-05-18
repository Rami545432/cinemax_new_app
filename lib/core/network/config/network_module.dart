import 'package:dio/dio.dart';
import 'package:movify/core/network/config/app_dio.dart';

class NetworkModule {
  static Dio provideDio() => AppDio.instance;

  static void configureDio() {}
}
