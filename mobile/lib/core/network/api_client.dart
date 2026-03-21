import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../config/app_env.dart';
import '../storage/secure_storage.dart';
import 'interceptors.dart';

class ApiClient {
  static String get baseUrl => AppEnv.baseUrl;

  late final Dio _dio;
  final SecureStorage _storage;
  final void Function()? onLogout;

  ApiClient({required SecureStorage storage, this.onLogout})
      : _storage = storage {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _dio.interceptors.addAll([
      AuthInterceptor(
        storage: _storage,
        dio: _dio,
        baseUrl: baseUrl,
        onLogout: onLogout,
      ),
      ErrorInterceptor(),
      if (kDebugMode)
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          requestHeader: true,
          responseHeader: true,
          error: true,
          logPrint: (o) => debugPrint('[DIO] $o'),
        ),
    ]);
  }

  Dio get dio => _dio;
}