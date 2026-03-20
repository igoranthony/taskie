import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/task.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
class TaskModel with _$TaskModel {
  const TaskModel._();

  const factory TaskModel({
    required String id,
    required String titulo,
    String? descricao,
    required String status,
    required String prioridade,
    // API returns FK int for criado_por; criado_por_username is the display value
    @JsonKey(name: 'criado_por_username') required String criadoPor,
    // API returns FK int for atribuido_para; atribuido_para_username is the display value
    // Raw FK int — used when sending to API
    @JsonKey(name: 'atribuido_para') int? atribuidoParaId,
    // Display username — used for rendering
    @JsonKey(name: 'atribuido_para_username') String? atribuidoPara,
    @JsonKey(name: 'data_limite') String? dataLimite,
    @JsonKey(name: 'criado_em') required String criadoEm,
    @JsonKey(name: 'atualizado_em') required String atualizadoEm,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);

  Task toEntity() => Task(
        id: id,
        titulo: titulo,
        descricao: descricao,
        status: _statusFromString(status),
        prioridade: _priorityFromString(prioridade),
        criadoPor: criadoPor,
        atribuidoPara: atribuidoPara,
        atribuidoParaId: atribuidoParaId,
        dataLimite: dataLimite != null ? DateTime.parse(dataLimite!) : null,
        criadoEm: DateTime.parse(criadoEm),
        atualizadoEm: DateTime.parse(atualizadoEm),
      );

  factory TaskModel.fromEntity(Task task) => TaskModel(
        id: task.id,
        titulo: task.titulo,
        descricao: task.descricao,
        status: statusToString(task.status),
        prioridade: priorityToString(task.prioridade),
        criadoPor: task.criadoPor,
        atribuidoPara: task.atribuidoPara,
        dataLimite: task.dataLimite?.toIso8601String(),
        criadoEm: task.criadoEm.toIso8601String(),
        atualizadoEm: task.atualizadoEm.toIso8601String(),
      );

  static TaskStatus _statusFromString(String s) => switch (s) {
        'em_andamento' => TaskStatus.emAndamento,
        'concluido' => TaskStatus.concluido,
        _ => TaskStatus.backlog,
      };

  static TaskPriority _priorityFromString(String s) => switch (s) {
        'baixa' => TaskPriority.baixa,
        'alta' => TaskPriority.alta,
        _ => TaskPriority.media,
      };

  static String statusToString(TaskStatus s) => switch (s) {
        TaskStatus.backlog => 'backlog',
        TaskStatus.emAndamento => 'em_andamento',
        TaskStatus.concluido => 'concluido',
      };

  static String priorityToString(TaskPriority p) => switch (p) {
        TaskPriority.baixa => 'baixa',
        TaskPriority.media => 'media',
        TaskPriority.alta => 'alta',
      };
}
