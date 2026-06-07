import 'dart:io';
import 'package:dio/dio.dart';
import '../../../../core/network/api_endpoints.dart';
import '../models/attachment_model.dart';

abstract class AttachmentRemoteDataSource {
  Future<AttachmentModel> upload({
    required String taskId,
    required File arquivo,
  });
  Future<void> delete(String id);
}

class AttachmentRemoteDataSourceImpl implements AttachmentRemoteDataSource {
  final Dio dio;

  AttachmentRemoteDataSourceImpl({required this.dio});

  @override
  Future<AttachmentModel> upload({
    required String taskId,
    required File arquivo,
  }) async {
    final formData = FormData.fromMap({
      'task': taskId,
      'arquivo': await MultipartFile.fromFile(
        arquivo.path,
        filename: arquivo.uri.pathSegments.last,
      ),
    });
    final response = await dio.post(
      ApiEndpoints.attachments,
      data: formData,
      options: Options(contentType: 'multipart/form-data'),
    );
    return AttachmentModel.fromJson(response.data);
  }

  @override
  Future<void> delete(String id) async {
    await dio.delete(ApiEndpoints.attachmentDetail(id));
  }
}
