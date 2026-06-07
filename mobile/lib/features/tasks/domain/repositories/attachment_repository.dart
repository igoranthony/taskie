import 'dart:io';
import '../entities/attachment.dart';

abstract class AttachmentRepository {
  Future<Attachment> upload({
    required String taskId,
    required File arquivo,
  });
  Future<void> delete(String id);
}
