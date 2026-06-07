import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/subtask.dart';

part 'subtask_model.freezed.dart';
part 'subtask_model.g.dart';

@freezed
abstract class SubtaskModel with _$SubtaskModel {
  const SubtaskModel._();

  const factory SubtaskModel({
    required String id,
    required String task,
    required String titulo,
    @Default(false) bool concluida,
    @Default(0) int posicao,
    @JsonKey(name: 'criado_em') required String criadoEm,
  }) = _SubtaskModel;

  factory SubtaskModel.fromJson(Map<String, dynamic> json) =>
      _$SubtaskModelFromJson(json);

  Subtask toEntity() => Subtask(
        id: id,
        taskId: task,
        titulo: titulo,
        concluida: concluida,
        posicao: posicao,
        criadoEm: DateTime.parse(criadoEm).toLocal(),
      );
}
