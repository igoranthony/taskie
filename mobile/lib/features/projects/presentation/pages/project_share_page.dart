import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../shared/widgets/app_error_widget.dart';
import '../../../../shared/widgets/app_loading.dart';
import '../../../../shared/widgets/app_snackbar.dart';
import '../../../../shared/widgets/confirm_dialog.dart';
import '../../domain/entities/project_member.dart';
import '../../domain/usecases/share_use_cases.dart';
import '../cubit/project_share_cubit.dart';
import '../cubit/project_share_state.dart';

class ProjectSharePage extends StatelessWidget {
  final String projectId;
  final String projectName;

  const ProjectSharePage({
    super.key,
    required this.projectId,
    required this.projectName,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProjectShareCubit(
        getInviteCode: getIt<GetInviteCode>(),
        refreshInviteCode: getIt<RefreshInviteCode>(),
        getMembers: getIt<GetMembers>(),
        acceptMember: getIt<AcceptMember>(),
        rejectMember: getIt<RejectMember>(),
        removeMember: getIt<RemoveMember>(),
      )..load(projectId),
      child: _ProjectShareView(projectName: projectName),
    );
  }
}

class _ProjectShareView extends StatelessWidget {
  final String projectName;

  const _ProjectShareView({required this.projectName});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: cs.surface,
      body: SafeArea(
        child: Column(
          children: [
            _Header(projectName: projectName),
            const SizedBox(height: 8),
            const Expanded(child: _Content()),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final String projectName;

  const _Header({required this.projectName});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Material(
              color: cs.surfaceContainer,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: () => context.pop(),
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  width: 38,
                  height: 38,
                  child: Icon(Icons.arrow_back, size: 18, color: cs.onSurface),
                ),
              ),
            ),
          ),
          Column(
            children: [
              Text(
                'Compartilhar',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: cs.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Text(
                projectName,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: cs.onSurfaceVariant,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectShareCubit, ProjectShareState>(
      builder: (context, state) => state.when(
        initial: () => const Center(child: AppLoading()),
        loading: () => const Center(child: AppLoading()),
        loaded: (code, members) {
          final pending =
              members.where((m) => m.status == MemberStatus.pending).toList();
          final accepted =
              members.where((m) => m.status == MemberStatus.accepted).toList();
          return ListView(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
            children: [
              _InviteCodeCard(code: code),
              const SizedBox(height: 28),
              _SectionTitle(text: 'PEDIDOS PENDENTES', count: pending.length),
              const SizedBox(height: 10),
              if (pending.isEmpty)
                _EmptyHint(text: 'Nenhum pedido pendente.')
              else
                ...pending.map((m) => _PendingRow(member: m)),
              const SizedBox(height: 28),
              _SectionTitle(text: 'MEMBROS', count: accepted.length),
              const SizedBox(height: 10),
              if (accepted.isEmpty)
                _EmptyHint(text: 'Ninguém aceito ainda.')
              else
                ...accepted.map((m) => _AcceptedRow(member: m)),
            ],
          );
        },
        failure: (message) => AppErrorWidget(
          error: message,
          message: 'Erro ao carregar compartilhamento',
          onRetry: () {
            final cubit = context.read<ProjectShareCubit>();
            // Reuses last projectId via load (assumes the page is rebuilt).
            cubit.refreshCode();
          },
        ),
      ),
    );
  }
}

class _InviteCodeCard extends StatelessWidget {
  final String code;

  const _InviteCodeCard({required this.code});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    return Material(
      color: cs.surfaceContainerLowest,
      borderRadius: BorderRadius.circular(16),
      elevation: 2,
      shadowColor: cs.shadow.withValues(alpha: 0.08),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 18, 20, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'CÓDIGO DE CONVITE',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: cs.onSurfaceVariant,
                letterSpacing: 1.0,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: SelectableText(
                    code,
                    style: tt.headlineSmall?.copyWith(
                      color: cs.onSurface,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 4.0,
                      fontFamily: 'monospace',
                    ),
                  ),
                ),
                Material(
                  color: cs.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: () async {
                      await Clipboard.setData(ClipboardData(text: code));
                      if (context.mounted) {
                        AppSnackbar.success(context, 'Código copiado.');
                      }
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: Icon(
                        Icons.copy_rounded,
                        size: 18,
                        color: cs.onPrimaryContainer,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Compartilhe este código com quem deve entrar no projeto. '
              'Gerar um novo invalida pedidos pendentes.',
              style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: () => _confirmRefresh(context),
                icon: const Icon(Icons.refresh_rounded, size: 16),
                label: const Text('Gerar novo código'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _confirmRefresh(BuildContext context) async {
    final cubit = context.read<ProjectShareCubit>();
    final confirmed = await ConfirmDialog.show(
      context,
      title: 'Gerar novo código',
      message:
          'O código atual será invalidado e os pedidos pendentes serão rejeitados.',
      confirmLabel: 'Gerar novo',
      destructive: true,
    );
    if (confirmed && context.mounted) {
      await cubit.refreshCode();
    }
  }
}

class _PendingRow extends StatelessWidget {
  final ProjectMember member;

  const _PendingRow({required this.member});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return _MemberRow(
      member: member,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            tooltip: 'Aceitar',
            icon: Icon(Icons.check_rounded, color: cs.primary, size: 22),
            onPressed: () =>
                context.read<ProjectShareCubit>().accept(member.usuarioId),
          ),
          IconButton(
            tooltip: 'Rejeitar',
            icon: Icon(Icons.close_rounded, color: cs.error, size: 22),
            onPressed: () =>
                context.read<ProjectShareCubit>().reject(member.usuarioId),
          ),
        ],
      ),
    );
  }
}

class _AcceptedRow extends StatelessWidget {
  final ProjectMember member;

  const _AcceptedRow({required this.member});

  @override
  Widget build(BuildContext context) {
    return _MemberRow(
      member: member,
      trailing: IconButton(
        tooltip: 'Remover',
        icon: const Icon(Icons.delete_outline, size: 20),
        onPressed: () => _confirmRemove(context, member),
      ),
    );
  }

  Future<void> _confirmRemove(BuildContext context, ProjectMember member) async {
    final cubit = context.read<ProjectShareCubit>();
    final confirmed = await ConfirmDialog.show(
      context,
      title: 'Remover membro',
      message: 'Remover "${member.username}" do projeto?',
      confirmLabel: 'Remover',
      destructive: true,
    );
    if (confirmed && context.mounted) {
      await cubit.remove(member.usuarioId);
    }
  }
}

class _MemberRow extends StatelessWidget {
  final ProjectMember member;
  final Widget trailing;

  const _MemberRow({required this.member, required this.trailing});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: cs.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 10, 8, 10),
          child: Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: cs.secondaryContainer,
                child: Text(
                  _initials(member.username),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: cs.onSecondaryContainer,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      member.username,
                      style: tt.bodyMedium?.copyWith(
                        color: cs.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (member.email.isNotEmpty)
                      Text(
                        member.email,
                        style: tt.labelSmall?.copyWith(
                          color: cs.onSurfaceVariant,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              ),
              trailing,
            ],
          ),
        ),
      ),
    );
  }

  String _initials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty || parts[0].isEmpty) return '?';
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  final int count;

  const _SectionTitle({required this.text, required this.count});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: cs.onSurfaceVariant,
            letterSpacing: 1.0,
          ),
        ),
        if (count > 0) ...[
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
            decoration: BoxDecoration(
              color: cs.surfaceContainerHigh,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '$count',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: cs.onSurfaceVariant,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class _EmptyHint extends StatelessWidget {
  final String text;

  const _EmptyHint({required this.text});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13,
          color: cs.onSurfaceVariant.withValues(alpha: 0.7),
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
