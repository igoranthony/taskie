import 'dart:convert';
import 'package:flutter/material.dart';

import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../../../core/storage/secure_storage.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final SecureStorage secureStorage;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.secureStorage,
  });

  @override
  Future<void> login(String email, String password) async {
    try {
      final loginResponse = await remoteDataSource.login(email, password);

      final accessToken = loginResponse['access'] as String?;
      final refreshToken = loginResponse['refresh'] as String?;

      if (accessToken != null) {
        await secureStorage.saveAccessToken(accessToken);
      }

      if (refreshToken != null) {
        await secureStorage.saveRefreshToken(refreshToken);
      }

      // Get and save user data
      try {
        final userModel = await remoteDataSource.getCurrentUser();
        final userJson = json.encode(userModel.toJson());
        await secureStorage.saveUserData(userJson);
      } catch (e) {
        // If user data fetch fails, we still have tokens
        debugPrint('Failed to fetch user data: $e');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<User?> getCurrentUser() async {
    try {
      // Try to get user from cache first
      final cachedUserData = await secureStorage.getUserData();
      if (cachedUserData != null) {
        final userJson = json.decode(cachedUserData);
        final userModel = UserModel.fromJson(userJson);
        return userModel.toEntity();
      }

      // If no cached data, fetch from server
      final userModel = await remoteDataSource.getCurrentUser();

      // Cache the user data
      final userJson = json.encode(userModel.toJson());
      await secureStorage.saveUserData(userJson);

      return userModel.toEntity();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> logout() async {
    try {
      await remoteDataSource.logout();
    } catch (e) {
      // Continue with local logout even if remote fails
      debugPrint('Remote logout failed: $e');
    }

    await secureStorage.clearTokens();
  }

  @override
  Future<bool> isAuthenticated() async {
    final accessToken = await secureStorage.getAccessToken();
    return accessToken != null;
  }

  @override
  Future<String?> getAccessToken() async {
    return await secureStorage.getAccessToken();
  }

  @override
  Future<String?> getRefreshToken() async {
    return await secureStorage.getRefreshToken();
  }
}