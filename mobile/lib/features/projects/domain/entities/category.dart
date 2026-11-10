import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String id;
  final String nome;
  final int totalProjetos;
  final DateTime criadoEm;

  const Category({
    required this.id,
    required this.nome,
    required this.totalProjetos,
    required this.criadoEm,
  });

  Category copyWith({String? nome, int? totalProjetos}) => Category(
        id: id,
        nome: nome ?? this.nome,
        totalProjetos: totalProjetos ?? this.totalProjetos,
        criadoEm: criadoEm,
      );

  @override
  List<Object?> get props => [id, nome, totalProjetos, criadoEm];
}
