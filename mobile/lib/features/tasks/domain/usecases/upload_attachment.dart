import 'dart:io';
import '../entities/attachment.dart';
import '../repositories/attachment_repository.dart';

class UploadAttachment {
  final AttachmentRepository repository;

  UploadAttachment(this.repository);

  Future<Attachment> call({
    required String taskId,
    required File arquivo,
  }) {
    return repository.upload(taskId: taskId, arquivo: arquivo);
  }
}
