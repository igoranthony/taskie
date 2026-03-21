import 'package:equatable/equatable.dart';

enum TaskStatus { backlog, emAndamento, concluido }
enum TaskPriority { baixa, media, alta }

class Task extends Equatable {
  final String id;
  final String titulo;
  final String? descricao;
  final TaskStatus status;
  final TaskPriority prioridade;
  final String criadoPor;
  /// Display name (username) for the assigned user
  final String? atribuidoPara;
  /// PK used when sending to the API (atribuido_para FK)
  final int? atribuidoParaId;
  final DateTime? dataLimite;
  final DateTime criadoEm;
  final DateTime atualizadoEm;
  final bool canEdit;

  const Task({
    required this.id,
    required this.titulo,
    this.descricao,
    required this.status,
    required this.prioridade,
    required this.criadoPor,
    this.atribuidoPara,
    this.atribuidoParaId,
    this.dataLimite,
    required this.criadoEm,
    required this.atualizadoEm,
    this.canEdit = false,
  });

  @override
  List<Object?> get props => [
        id,
        titulo,
        descricao,
        status,
        prioridade,
        criadoPor,
        atribuidoPara,
        atribuidoParaId,
        dataLimite,
        criadoEm,
        atualizadoEm,
        canEdit,
      ];

  Task copyWith({
    String? id,
    String? titulo,
    String? descricao,
    TaskStatus? status,
    TaskPriority? prioridade,
    String? criadoPor,
    String? atribuidoPara,
    int? atribuidoParaId,
    DateTime? dataLimite,
    DateTime? criadoEm,
    DateTime? atualizadoEm,
    bool? canEdit,
  }) {
    return Task(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      descricao: descricao ?? this.descricao,
      status: status ?? this.status,
      prioridade: prioridade ?? this.prioridade,
      criadoPor: criadoPor ?? this.criadoPor,
      atribuidoPara: atribuidoPara ?? this.atribuidoPara,
      atribuidoParaId: atribuidoParaId ?? this.atribuidoParaId,
      dataLimite: dataLimite ?? this.dataLimite,
      criadoEm: criadoEm ?? this.criadoEm,
      atualizadoEm: atualizadoEm ?? this.atualizadoEm,
      canEdit: canEdit ?? this.canEdit,
    );
  }
}
