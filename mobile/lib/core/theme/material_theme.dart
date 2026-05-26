import 'package:flutter/material.dart';
import '../../features/tasks/domain/entities/task.dart';

/// Extends [ColorScheme] with per-status color tokens.
/// Usage: `Theme.of(context).colorScheme.statusColor(task.status)`
extension TaskStatusColorScheme on ColorScheme {
  /// Returns `bg`, `fg` and `label` for a given [TaskStatus].
  /// - [bg]    → badge / chip background
  /// - [fg]    → text, dot, and accent color
  /// - [label] → localised display string
  ({Color color, IconData icon, String label}) priorityColor(TaskPriority priority) {
    final dark = brightness == Brightness.dark;
    return switch (priority) {
      TaskPriority.baixa => (
          color: const Color(0xFF71717A),
          icon: Icons.south_rounded,
          label: 'Baixa',
        ),
      TaskPriority.media => (
          color: dark ? const Color(0xFFFBBF24) : const Color(0xFFD97706),
          icon: Icons.east_rounded,
          label: 'Média',
        ),
      TaskPriority.alta => (
          color: dark ? const Color(0xFFF87171) : const Color(0xFFDC2626),
          icon: Icons.north_rounded,
          label: 'Alta',
        ),
    };
  }

  ({Color bg, Color fg, String label}) statusColor(TaskStatus status) {
    final dark = brightness == Brightness.dark;
    return switch (status) {
      TaskStatus.backlog => (
          bg: dark ? const Color(0xFF27272A) : const Color(0xFFF1F5F9),
          fg: dark ? const Color(0xFFA1A1AA) : const Color(0xFF475569),
          label: 'Backlog',
        ),
      TaskStatus.emAndamento => (
          bg: dark ? const Color(0xFF1E3A5F) : const Color(0xFFEFF6FF),
          fg: dark ? const Color(0xFF60A5FA) : const Color(0xFF2563EB),
          label: 'Em Andamento',
        ),
      TaskStatus.concluido => (
          bg: dark ? const Color(0xFF052E16) : const Color(0xFFDCFCE7),
          fg: dark ? const Color(0xFF34D399) : const Color(0xFF16A34A),
          label: 'Concluído',
        ),
    };
  }
}

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff10b981),
      surfaceTint: Color(0xff10b981),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffd1fae5),
      onPrimaryContainer: Color(0xff064e3b),
      secondary: Color(0xff059669),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffa7f3d0),
      onSecondaryContainer: Color(0xff065f46),
      tertiary: Color(0xff374151),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffe5e7eb),
      onTertiaryContainer: Color(0xff1f2937),
      error: Color(0xffdc2626),
      onError: Color(0xffffffff),
      errorContainer: Color(0xfffee2e2),
      onErrorContainer: Color(0xff991b1b),
      surface: Color(0xfff9fafb),
      onSurface: Color(0xff111827),
      onSurfaceVariant: Color(0xff4b5563),
      outline: Color(0xff9ca3af),
      outlineVariant: Color(0xffe5e7eb),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff1f2937),
      inversePrimary: Color(0xff34d399),
      primaryFixed: Color(0xffd1fae5),
      onPrimaryFixed: Color(0xff022c22),
      primaryFixedDim: Color(0xff34d399),
      onPrimaryFixedVariant: Color(0xff065f46),
      secondaryFixed: Color(0xffa7f3d0),
      onSecondaryFixed: Color(0xff022c22),
      secondaryFixedDim: Color(0xff6ee7b7),
      onSecondaryFixedVariant: Color(0xff047857),
      tertiaryFixed: Color(0xffe5e7eb),
      onTertiaryFixed: Color(0xff111827),
      tertiaryFixedDim: Color(0xff9ca3af),
      onTertiaryFixedVariant: Color(0xff374151),
      surfaceDim: Color(0xffd1d5db),
      surfaceBright: Color(0xfff9fafb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff3f4f6),
      surfaceContainer: Color(0xffe5e7eb),
      surfaceContainerHigh: Color(0xffd1d5db),
      surfaceContainerHighest: Color(0xffb0b7c3),
    );
  }

  ThemeData light() => theme(lightScheme());

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff34d399),
      surfaceTint: Color(0xff34d399),
      onPrimary: Color(0xff022c22),
      primaryContainer: Color(0xff065f46),
      onPrimaryContainer: Color(0xffd1fae5),
      secondary: Color(0xff6ee7b7),
      onSecondary: Color(0xff022c22),
      secondaryContainer: Color(0xff047857),
      onSecondaryContainer: Color(0xffa7f3d0),
      tertiary: Color(0xffa1a1aa),
      onTertiary: Color(0xff18181b),
      tertiaryContainer: Color(0xff3f3f46),
      onTertiaryContainer: Color(0xffe4e4e7),
      error: Color(0xfff87171),
      onError: Color(0xff7f1d1d),
      errorContainer: Color(0xff7f1d1d),
      onErrorContainer: Color(0xfffee2e2),
      surface: Color(0xff0f0f0f),
      onSurface: Color(0xfff4f4f5),
      onSurfaceVariant: Color(0xffa1a1aa),
      outline: Color(0xff52525b),
      outlineVariant: Color(0xff3f3f46),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff4f4f5),
      inversePrimary: Color(0xff10b981),
      primaryFixed: Color(0xffd1fae5),
      onPrimaryFixed: Color(0xff022c22),
      primaryFixedDim: Color(0xff34d399),
      onPrimaryFixedVariant: Color(0xff065f46),
      secondaryFixed: Color(0xffa7f3d0),
      onSecondaryFixed: Color(0xff022c22),
      secondaryFixedDim: Color(0xff6ee7b7),
      onSecondaryFixedVariant: Color(0xff047857),
      tertiaryFixed: Color(0xffe4e4e7),
      onTertiaryFixed: Color(0xff18181b),
      tertiaryFixedDim: Color(0xffa1a1aa),
      onTertiaryFixedVariant: Color(0xff52525b),
      surfaceDim: Color(0xff080808),
      surfaceBright: Color(0xff2a2a2a),
      surfaceContainerLowest: Color(0xff1c1c1e),
      surfaceContainerLow: Color(0xff222224),
      surfaceContainer: Color(0xff2a2a2c),
      surfaceContainerHigh: Color(0xff323234),
      surfaceContainerHighest: Color(0xff404044),
    );
  }

  ThemeData dark() => theme(darkScheme());

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );
}
