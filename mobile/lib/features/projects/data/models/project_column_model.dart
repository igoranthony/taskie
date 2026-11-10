import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/project_column.dart';

part 'project_column_model.freezed.dart';
part 'project_column_model.g.dart';

@freezed
abstract class ProjectColumnModel with _$ProjectColumnModel {
  const ProjectColumnModel._();

  const factory ProjectColumnModel({
    required String id,
    required String nome,
    @Default(0) int posicao,
    @JsonKey(name: 'is_done_column') @Default(false) bool isDoneColumn,
  }) = _ProjectColumnModel;

  factory ProjectColumnModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectColumnModelFromJson(json);

  ProjectColumn toEntity() => ProjectColumn(
        id: id,
        nome: nome,
        posicao: posicao,
        isDoneColumn: isDoneColumn,
      );
}
