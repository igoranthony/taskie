import 'package:equatable/equatable.dart';

enum MemberStatus { pending, accepted, rejected }

class ProjectMember extends Equatable {
  final String id;
  final int usuarioId;
  final String username;
  final String email;
  final MemberStatus status;
  final DateTime criadoEm;

  const ProjectMember({
    required this.id,
    required this.usuarioId,
    required this.username,
    required this.email,
    required this.status,
    required this.criadoEm,
  });

  @override
  List<Object?> get props =>
      [id, usuarioId, username, email, status, criadoEm];
}
