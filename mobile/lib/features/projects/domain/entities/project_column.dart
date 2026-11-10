import 'package:equatable/equatable.dart';

class ProjectColumn extends Equatable {
  final String id;
  final String nome;
  final int posicao;
  final bool isDoneColumn;

  const ProjectColumn({
    required this.id,
    required this.nome,
    required this.posicao,
    required this.isDoneColumn,
  });

  @override
  List<Object?> get props => [id, nome, posicao, isDoneColumn];
}
