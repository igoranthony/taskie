import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/category.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
abstract class CategoryModel with _$CategoryModel {
  const CategoryModel._();

  const factory CategoryModel({
    required String id,
    required String nome,
    @JsonKey(name: 'total_projetos') @Default(0) int totalProjetos,
    @JsonKey(name: 'criado_em') required String criadoEm,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Category toEntity() => Category(
        id: id,
        nome: nome,
        totalProjetos: totalProjetos,
        criadoEm: DateTime.parse(criadoEm).toLocal(),
      );
}
