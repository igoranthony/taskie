import 'package:taskie/core/errors/app_error_parser.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/network/api_endpoints.dart';
import '../../domain/entities/user_summary.dart';
import 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  final Dio _dio;

  UsersCubit(this._dio) : super(const UsersState.initial());

  Future<void> loadUsers() async {
    emit(const UsersState.loading());
    try {
      final response = await _dio.get(ApiEndpoints.users);
      final List<dynamic> data =
          response.data is List ? response.data : response.data['results'] ?? [];
      final users = data.map((json) => UserSummary.fromJson(json)).toList();
      emit(UsersState.loaded(users));
    } catch (e) {
      emit(UsersState.failure(AppErrorParser.parse(e)));
    }
  }
}
