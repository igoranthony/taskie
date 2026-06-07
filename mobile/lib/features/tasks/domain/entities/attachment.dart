import 'package:equatable/equatable.dart';

class Attachment extends Equatable {
  final String id;
  final String taskId;
  final String arquivoUrl;
  final String nomeOriginal;
  final String? mimeType;
  final int? tamanhoBytes;
  final DateTime criadoEm;

  const Attachment({
    required this.id,
    required this.taskId,
    required this.arquivoUrl,
    required this.nomeOriginal,
    this.mimeType,
    this.tamanhoBytes,
    required this.criadoEm,
  });

  @override
  List<Object?> get props => [
        id,
        taskId,
        arquivoUrl,
        nomeOriginal,
        mimeType,
        tamanhoBytes,
        criadoEm,
      ];
}
