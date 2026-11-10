import 'package:equatable/equatable.dart';

class Subtask extends Equatable {
  final String id;
  final String taskId;
  final String titulo;
  final bool concluida;
  final int posicao;
  final DateTime criadoEm;

  const Subtask({
    required this.id,
    required this.taskId,
    required this.titulo,
    required this.concluida,
    required this.posicao,
    required this.criadoEm,
  });

  Subtask copyWith({
    String? id,
    String? taskId,
    String? titulo,
    bool? concluida,
    int? posicao,
    DateTime? criadoEm,
  }) {
    return Subtask(
      id: id ?? this.id,
      taskId: taskId ?? this.taskId,
      titulo: titulo ?? this.titulo,
      concluida: concluida ?? this.concluida,
      posicao: posicao ?? this.posicao,
      criadoEm: criadoEm ?? this.criadoEm,
    );
  }

  @override
  List<Object?> get props => [id, taskId, titulo, concluida, posicao, criadoEm];
}
