import 'package:dio/dio.dart';

class SettingServices {
  SettingServices();

  static Dio getSettingDio(
    String baseUrl, {
    int connectionTimeout = 10000,
    int requestTimeout = 10000,
  }) {
    final BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: connectionTimeout,
      sendTimeout: 10000,
      receiveTimeout: requestTimeout,
    );
    return Dio(options);
  }
}
