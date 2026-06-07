import 'package:equatable/equatable.dart';
import 'subtask.dart';
import 'attachment.dart';

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
  /// FK do projeto (null = task "solta", sem projeto)
  final String? projetoId;
  /// FK da coluna (null = task sem projeto). Pra task com projeto, define
  /// a posição visual no board e — com `is_done_column` — o status derivado.
  final String? colunaId;
  final List<Subtask> subtarefas;
  final List<Attachment> anexos;

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
    this.projetoId,
    this.colunaId,
    this.subtarefas = const [],
    this.anexos = const [],
  });

  int get subtarefasTotal => subtarefas.length;
  int get subtarefasConcluidas =>
      subtarefas.where((s) => s.concluida).length;

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
        projetoId,
        colunaId,
        subtarefas,
        anexos,
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
    String? projetoId,
    String? colunaId,
    List<Subtask>? subtarefas,
    List<Attachment>? anexos,
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
      projetoId: projetoId ?? this.projetoId,
      colunaId: colunaId ?? this.colunaId,
      subtarefas: subtarefas ?? this.subtarefas,
      anexos: anexos ?? this.anexos,
    );
  }
}
