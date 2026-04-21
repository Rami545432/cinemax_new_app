import 'package:cinemax_app_new/core/network/config/app_dio.dart';
import 'package:dio/dio.dart';

class NetworkModule {
  static Dio provideDio() => AppDio.instance;

  static void configureDio() {}
}
