import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/app_snackbar.dart';
import '../../domain/entities/user_settings.dart';
import '../cubit/user_settings_cubit.dart';

const _accentColors = <String>[
  '#10b981', // padrão
  '#7c6af7',
  '#f59e0b',
  '#ef4444',
  '#3b82f6',
  '#ec4899',
  '#14b8a6',
  '#64748b',
];

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: cs.surface,
      body: SafeArea(
        child: Column(
          children: [
            const _Header(),
            const SizedBox(height: 8),
            const Expanded(child: _Content()),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

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
          Text(
            'Configurações',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: cs.onSurface,
                  fontWeight: FontWeight.w600,
                ),
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
    return BlocBuilder<UserSettingsCubit, UserSettings>(
      builder: (context, settings) => ListView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
        children: [
          _SectionLabel('TEMA'),
          const SizedBox(height: 10),
          _ThemeToggle(current: settings.tema),
          const SizedBox(height: 28),
          _SectionLabel('COR DE DESTAQUE'),
          const SizedBox(height: 10),
          _AccentPicker(selected: settings.corAccent),
        ],
      ),
    );
  }
}

class _ThemeToggle extends StatelessWidget {
  final AppThemeMode current;

  const _ThemeToggle({required this.current});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Material(
      color: cs.surfaceContainerLowest,
      borderRadius: BorderRadius.circular(14),
      elevation: 2,
      shadowColor: cs.shadow.withValues(alpha: 0.08),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: _ThemeOption(
                label: 'Escuro',
                icon: Icons.dark_mode_outlined,
                selected: current == AppThemeMode.dark,
                mode: AppThemeMode.dark,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _ThemeOption(
                label: 'Claro',
                icon: Icons.light_mode_outlined,
                selected: current == AppThemeMode.light,
                mode: AppThemeMode.light,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ThemeOption extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool selected;
  final AppThemeMode mode;

  const _ThemeOption({
    required this.label,
    required this.icon,
    required this.selected,
    required this.mode,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Material(
      color: selected ? cs.primaryContainer : Colors.transparent,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: () async {
          if (selected) return;
          final err =
              await context.read<UserSettingsCubit>().update(tema: mode);
          if (err != null && context.mounted) {
            AppSnackbar.error(context, err);
          }
        },
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              Icon(
                icon,
                size: 22,
                color: selected ? cs.onPrimaryContainer : cs.onSurfaceVariant,
              ),
              const SizedBox(height: 6),
              Text(
                label,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: selected ? cs.onPrimaryContainer : cs.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AccentPicker extends StatelessWidget {
  final String selected;

  const _AccentPicker({required this.selected});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 14,
      runSpacing: 14,
      children: _accentColors.map((hex) {
        final color = _parseHex(hex) ?? Theme.of(context).colorScheme.primary;
        final isSelected = hex.toLowerCase() == selected.toLowerCase();
        return GestureDetector(
          onTap: () async {
            if (isSelected) return;
            final err = await context
                .read<UserSettingsCubit>()
                .update(corAccent: hex);
            if (err != null && context.mounted) {
              AppSnackbar.error(context, err);
            }
          },
          child: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected
                    ? Theme.of(context).colorScheme.onSurface
                    : Colors.transparent,
                width: 3,
              ),
            ),
            child: isSelected
                ? const Icon(Icons.check, color: Colors.white, size: 22)
                : null,
          ),
        );
      }).toList(),
    );
  }

  Color? _parseHex(String hex) {
    final clean = hex.replaceAll('#', '').trim();
    if (clean.length != 6) return null;
    final value = int.tryParse('FF$clean', radix: 16);
    return value == null ? null : Color(value);
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
