import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../shared/widgets/app_snackbar.dart';
import '../../../../../shared/widgets/confirm_dialog.dart';
import '../../../domain/entities/attachment.dart';
import '../../bloc/task_detail/task_detail_bloc.dart';
import '../../bloc/task_detail/task_detail_event.dart';

class TaskAttachmentsSection extends StatelessWidget {
  final List<Attachment> anexos;
  final bool canEdit;

  const TaskAttachmentsSection({
    super.key,
    required this.anexos,
    required this.canEdit,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final total = anexos.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _SectionLabel('ANEXOS'),
            const SizedBox(width: 8),
            if (total > 0)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                decoration: BoxDecoration(
                  color: cs.surfaceContainerHigh,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '$total',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: cs.onSurfaceVariant,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 10),
        if (anexos.isEmpty && !canEdit)
          Text(
            'Nenhum anexo',
            style: TextStyle(
              fontSize: 13,
              color: cs.onSurfaceVariant.withValues(alpha: 0.7),
              fontStyle: FontStyle.italic,
            ),
          )
        else ...[
          for (final a in anexos) _AttachmentRow(attachment: a, canEdit: canEdit),
          if (canEdit) ...[
            const SizedBox(height: 4),
            _AddAttachmentButton(),
          ],
        ],
      ],
    );
  }
}

class _AttachmentRow extends StatelessWidget {
  final Attachment attachment;
  final bool canEdit;

  const _AttachmentRow({required this.attachment, required this.canEdit});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: cs.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: () => _open(context, attachment.arquivoUrl),
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: cs.primaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    _iconFor(attachment.mimeType, attachment.nomeOriginal),
                    size: 16,
                    color: cs.onPrimaryContainer,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        attachment.nomeOriginal,
                        style: tt.bodyMedium?.copyWith(
                          color: cs.onSurface,
                          fontWeight: FontWeight.w500,
                          height: 1.3,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (attachment.tamanhoBytes != null) ...[
                        const SizedBox(height: 2),
                        Text(
                          _formatBytes(attachment.tamanhoBytes!),
                          style: tt.labelSmall?.copyWith(
                            color: cs.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                if (canEdit)
                  InkWell(
                    onTap: () => _confirmDelete(context),
                    borderRadius: BorderRadius.circular(6),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Icon(
                        Icons.close,
                        size: 16,
                        color: cs.onSurfaceVariant,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _open(BuildContext context, String url) async {
    final uri = Uri.tryParse(url);
    if (uri == null) return;
    final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!ok && context.mounted) {
      AppSnackbar.error(context, 'Não foi possível abrir o anexo.');
    }
  }

  Future<void> _confirmDelete(BuildContext context) async {
    final bloc = context.read<TaskDetailBloc>();
    final confirmed = await ConfirmDialog.show(
      context,
      title: 'Remover anexo',
      message: 'Remover "${attachment.nomeOriginal}"?',
      confirmLabel: 'Remover',
      destructive: true,
    );
    if (confirmed) {
      bloc.add(TaskDetailEvent.attachmentDeleted(attachment.id));
    }
  }

  IconData _iconFor(String? mime, String nome) {
    final m = mime ?? '';
    if (m.startsWith('image/')) return Icons.image_outlined;
    if (m.startsWith('video/')) return Icons.videocam_outlined;
    if (m.startsWith('audio/')) return Icons.audiotrack_outlined;
    if (m == 'application/pdf' || nome.toLowerCase().endsWith('.pdf')) {
      return Icons.picture_as_pdf_outlined;
    }
    return Icons.insert_drive_file_outlined;
  }

  String _formatBytes(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
  }
}

class _AddAttachmentButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Material(
      color: cs.surfaceContainerLowest,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: () => _pickFile(context),
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          child: Row(
            children: [
              Icon(Icons.attach_file_outlined, size: 18, color: cs.primary),
              const SizedBox(width: 12),
              Text(
                'Anexar arquivo',
                style: TextStyle(
                  fontSize: 14,
                  color: cs.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickFile(BuildContext context) async {
    final bloc = context.read<TaskDetailBloc>();
    try {
      final result = await FilePicker.platform.pickFiles();
      if (result == null || result.files.single.path == null) return;
      final file = File(result.files.single.path!);
      bloc.add(TaskDetailEvent.attachmentUploaded(file));
    } catch (_) {
      if (context.mounted) {
        AppSnackbar.error(context, 'Erro ao selecionar arquivo.');
      }
    }
  }
}

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel(this.text);

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Text(
      text,
      style: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w700,
        color: cs.onSurfaceVariant,
        letterSpacing: 1.0,
      ),
    );
  }
}
