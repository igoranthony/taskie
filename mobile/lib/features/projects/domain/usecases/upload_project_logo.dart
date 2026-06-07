import 'dart:io';
import '../entities/project.dart';
import '../repositories/project_repository.dart';

class UploadProjectLogo {
  final ProjectRepository repository;

  UploadProjectLogo(this.repository);

  Future<Project> call(String projectId, File logo) =>
      repository.uploadLogo(projectId, logo);
}
