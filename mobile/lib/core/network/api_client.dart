import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../storage/secure_storage.dart';
import 'interceptors.dart';

class ApiClient {
  static const String baseUrl = 'http://192.168.1.3:8000/api';

  late final Dio _dio;
  final SecureStorage _storage;

  ApiClient({required SecureStorage storage}) : _storage = storage {
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
      AuthInterceptor(storage: _storage),
      ErrorInterceptor(),
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