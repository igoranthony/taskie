import 'package:dio/dio.dart';
import '../../../../core/network/api_endpoints.dart';
import '../models/user_settings_model.dart';

abstract class SettingsRemoteDataSource {
  Future<UserSettingsModel> get();
  Future<UserSettingsModel> update({String? tema, String? corAccent});
}

class SettingsRemoteDataSourceImpl implements SettingsRemoteDataSource {
  final Dio dio;

  SettingsRemoteDataSourceImpl({required this.dio});

  @override
  Future<UserSettingsModel> get() async {
    final response = await dio.get(ApiEndpoints.userSettings);
    return UserSettingsModel.fromJson(response.data);
  }

  @override
  Future<UserSettingsModel> update({String? tema, String? corAccent}) async {
    final body = <String, dynamic>{
      'tema': ?tema,
      'cor_accent': ?corAccent,
    };
    final response = await dio.put(ApiEndpoints.userSettings, data: body);
    return UserSettingsModel.fromJson(response.data);
  }
}
