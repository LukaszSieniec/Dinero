import 'package:dinero/core/config/app_environment.dart';
import 'package:dinero/core/di/dependency_injection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class NetworkModule {
  static const Duration _timeout = Duration(seconds: 5);

  @lazySingleton
  PrettyDioLogger get logger => PrettyDioLogger(
        requestHeader: kDebugMode,
        requestBody: kDebugMode,
        responseHeader: kDebugMode,
      );

  @lazySingleton
  Dio dio(PrettyDioLogger logger) {
    final appEnvironment = inject<AppEnvironment>();

    final dio = Dio()
      ..options = BaseOptions(
        baseUrl: appEnvironment.baseUrl,
        connectTimeout: _timeout,
        receiveTimeout: _timeout,
        contentType: 'application/json',
      );

    // Access token interceptor.
    // Auth error interceptor.

    dio.interceptors.addAll(
      [logger],
    );

    return dio;
  }
}
