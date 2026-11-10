import '../repositories/attachment_repository.dart';

class DeleteAttachment {
  final AttachmentRepository repository;

  DeleteAttachment(this.repository);

  Future<void> call(String id) => repository.delete(id);
}
