import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/attachment.dart';

part 'attachment_model.freezed.dart';
part 'attachment_model.g.dart';

@freezed
abstract class AttachmentModel with _$AttachmentModel {
  const AttachmentModel._();

  const factory AttachmentModel({
    required String id,
    required String task,
    @JsonKey(name: 'arquivo_url') required String arquivoUrl,
    @JsonKey(name: 'nome_original') required String nomeOriginal,
    @JsonKey(name: 'mime_type') String? mimeType,
    @JsonKey(name: 'tamanho_bytes') int? tamanhoBytes,
    @JsonKey(name: 'criado_em') required String criadoEm,
  }) = _AttachmentModel;

  factory AttachmentModel.fromJson(Map<String, dynamic> json) =>
      _$AttachmentModelFromJson(json);

  Attachment toEntity() => Attachment(
        id: id,
        taskId: task,
        arquivoUrl: arquivoUrl,
        nomeOriginal: nomeOriginal,
        mimeType: mimeType,
        tamanhoBytes: tamanhoBytes,
        criadoEm: DateTime.parse(criadoEm).toLocal(),
      );
}
