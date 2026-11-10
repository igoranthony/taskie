import 'dart:io';
import '../../domain/entities/attachment.dart';
import '../../domain/repositories/attachment_repository.dart';
import '../datasources/attachment_remote_datasource.dart';

class AttachmentRepositoryImpl implements AttachmentRepository {
  final AttachmentRemoteDataSource remoteDataSource;

  AttachmentRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Attachment> upload({
    required String taskId,
    required File arquivo,
  }) async {
    final model = await remoteDataSource.upload(taskId: taskId, arquivo: arquivo);
    return model.toEntity();
  }

  @override
  Future<void> delete(String id) async {
    await remoteDataSource.delete(id);
  }
}
