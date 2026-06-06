import 'package:equatable/equatable.dart';

enum ProjectStatus { ativo, pausado, concluido }

class Project extends Equatable {
  final String id;
  final String nome;
  final String cor;
  final String? logoUrl;
  final String? categoriaId;
  final String? categoriaNome;
  final ProjectStatus status;
  final int totalTasks;
  final int doneTasks;
  final bool isOwner;
  final String? inviteCode;
  final int pendingMembersCount;
  final DateTime criadoEm;

  const Project({
    required this.id,
    required this.nome,
    required this.cor,
    this.logoUrl,
    this.categoriaId,
    this.categoriaNome,
    required this.status,
    required this.totalTasks,
    required this.doneTasks,
    required this.isOwner,
    this.inviteCode,
    required this.pendingMembersCount,
    required this.criadoEm,
  });

  double get progress => totalTasks == 0 ? 0 : doneTasks / totalTasks;

  @override
  List<Object?> get props => [
        id,
        nome,
        cor,
        logoUrl,
        categoriaId,
        categoriaNome,
        status,
        totalTasks,
        doneTasks,
        isOwner,
        inviteCode,
        pendingMembersCount,
        criadoEm,
      ];

  Project copyWith({
    String? id,
    String? nome,
    String? cor,
    String? logoUrl,
    String? categoriaId,
    String? categoriaNome,
    ProjectStatus? status,
    int? totalTasks,
    int? doneTasks,
    bool? isOwner,
    String? inviteCode,
    int? pendingMembersCount,
    DateTime? criadoEm,
  }) {
    return Project(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      cor: cor ?? this.cor,
      logoUrl: logoUrl ?? this.logoUrl,
      categoriaId: categoriaId ?? this.categoriaId,
      categoriaNome: categoriaNome ?? this.categoriaNome,
      status: status ?? this.status,
      totalTasks: totalTasks ?? this.totalTasks,
      doneTasks: doneTasks ?? this.doneTasks,
      isOwner: isOwner ?? this.isOwner,
      inviteCode: inviteCode ?? this.inviteCode,
      pendingMembersCount: pendingMembersCount ?? this.pendingMembersCount,
      criadoEm: criadoEm ?? this.criadoEm,
    );
  }
}
