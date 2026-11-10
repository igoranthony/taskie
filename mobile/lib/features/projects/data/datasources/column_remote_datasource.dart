import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import '../../../../core/network/api_endpoints.dart';
import '../models/project_column_model.dart';

abstract class ColumnRemoteDataSource {
  Future<ProjectColumnModel> create({
    required String projectId,
    required String nome,
    required int posicao,
    required bool isDoneColumn,
  });
  Future<ProjectColumnModel> update({
    required String id,
    required String nome,
    required bool isDoneColumn,
  });
  Future<void> reorder({
    required String projectId,
    required List<String> ids,
  });
  Future<void> delete(String id);
}

class ColumnRemoteDataSourceImpl implements ColumnRemoteDataSource {
  final Dio dio;

  ColumnRemoteDataSourceImpl({required this.dio});

  @override
  Future<ProjectColumnModel> create({
    required String projectId,
    required String nome,
    required int posicao,
    required bool isDoneColumn,
  }) async {
    final response = await dio.post(ApiEndpoints.columns, data: {
      'projeto': projectId,
      'nome': nome,
      'posicao': posicao,
      'is_done_column': isDoneColumn,
    });
    return ProjectColumnModel.fromJson(response.data);
  }

  @override
  Future<ProjectColumnModel> update({
    required String id,
    required String nome,
    required bool isDoneColumn,
  }) async {
    final response = await dio.put(ApiEndpoints.columnDetail(id), data: {
      'nome': nome,
      'is_done_column': isDoneColumn,
    });
    return ProjectColumnModel.fromJson(response.data);
  }

  @override
  Future<void> reorder({
    required String projectId,
    required List<String> ids,
  }) async {
    developer.log(
      'PUT ${ApiEndpoints.projectColumnsReorder(projectId)} ids=$ids',
      name: 'ColumnRemoteDataSource.reorder',
    );
    await dio.put(
      ApiEndpoints.projectColumnsReorder(projectId),
      data: {'ids': ids},
    );
  }

  @override
  Future<void> delete(String id) async {
    await dio.delete(ApiEndpoints.columnDetail(id));
  }
}
