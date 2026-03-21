import 'package:flutter/material.dart';
import '../../features/tasks/domain/entities/task.dart';

/// Extends [ColorScheme] with per-status color tokens.
/// Usage: `Theme.of(context).colorScheme.statusColor(task.status)`
extension TaskStatusColorScheme on ColorScheme {
  /// Returns `bg`, `fg` and `label` for a given [TaskStatus].
  /// - [bg]    → badge / chip background
  /// - [fg]    → text, dot, and accent color
  /// - [label] → localised display string
  ({Color bg, Color fg, String label}) statusColor(TaskStatus status) {
    final dark = brightness == Brightness.dark;
    return switch (status) {
      TaskStatus.backlog => (
          bg: dark ? const Color(0xFF1E293B) : const Color(0xFFE2E8F0),
          fg: dark ? const Color(0xFF94A3B8) : const Color(0xFF475569),
          label: 'Backlog',
        ),
      TaskStatus.emAndamento => (
          bg: dark ? const Color(0xFF2D1802) : const Color(0xFFFEF3C7),
          fg: dark ? const Color(0xFFFBBF24) : const Color(0xFF92400E),
          label: 'Em Andamento',
        ),
      TaskStatus.concluido => (
          bg: dark ? const Color(0xFF052E16) : const Color(0xFFD1FAE5),
          fg: dark ? const Color(0xFF34D399) : const Color(0xFF065F46),
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
      primary: Color(0xff415f91),
      surfaceTint: Color(0xff415f91),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffd6e3ff),
      onPrimaryContainer: Color(0xff284777),
      secondary: Color(0xff435e91),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffd8e2ff),
      onSecondaryContainer: Color(0xff2a4678),
      tertiary: Color(0xff166683),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffc0e8ff),
      onTertiaryContainer: Color(0xff004d66),
      error: Color(0xff904a43),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad5),
      onErrorContainer: Color(0xff73342d),
      surface: Color(0xfff6fafe),
      onSurface: Color(0xff171c1f),
      onSurfaceVariant: Color(0xff43474e),
      outline: Color(0xff73777f),
      outlineVariant: Color(0xffc3c6cf),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c3134),
      inversePrimary: Color(0xffaac7ff),
      primaryFixed: Color(0xffd6e3ff),
      onPrimaryFixed: Color(0xff001b3e),
      primaryFixedDim: Color(0xffaac7ff),
      onPrimaryFixedVariant: Color(0xff284777),
      secondaryFixed: Color(0xffd8e2ff),
      onSecondaryFixed: Color(0xff001a41),
      secondaryFixedDim: Color(0xffadc7ff),
      onSecondaryFixedVariant: Color(0xff2a4678),
      tertiaryFixed: Color(0xffc0e8ff),
      onTertiaryFixed: Color(0xff001e2b),
      tertiaryFixedDim: Color(0xff8dcff1),
      onTertiaryFixedVariant: Color(0xff004d66),
      surfaceDim: Color(0xffd6dade),
      surfaceBright: Color(0xfff6fafe),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff0f4f8),
      surfaceContainer: Color(0xffeaeef2),
      surfaceContainerHigh: Color(0xffe5e9ed),
      surfaceContainerHighest: Color(0xffdfe3e7),
    );
  }

  ThemeData light() => theme(lightScheme());

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffaac7ff),
      surfaceTint: Color(0xffaac7ff),
      onPrimary: Color(0xff0b305f),
      primaryContainer: Color(0xff284777),
      onPrimaryContainer: Color(0xffd6e3ff),
      secondary: Color(0xffadc7ff),
      onSecondary: Color(0xff0f2f60),
      secondaryContainer: Color(0xff2a4678),
      onSecondaryContainer: Color(0xffd8e2ff),
      tertiary: Color(0xff8dcff1),
      onTertiary: Color(0xff003547),
      tertiaryContainer: Color(0xff004d66),
      onTertiaryContainer: Color(0xffc0e8ff),
      error: Color(0xffffb4ab),
      onError: Color(0xff561e19),
      errorContainer: Color(0xff73342d),
      onErrorContainer: Color(0xffffdad5),
      surface: Color(0xff111111),
      onSurface: Color(0xffdfe3e7),
      onSurfaceVariant: Color(0xffc3c6cf),
      outline: Color(0xff8d9199),
      outlineVariant: Color(0xff43474e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdfe3e7),
      inversePrimary: Color(0xff415f91),
      primaryFixed: Color(0xffd6e3ff),
      onPrimaryFixed: Color(0xff001b3e),
      primaryFixedDim: Color(0xffaac7ff),
      onPrimaryFixedVariant: Color(0xff284777),
      secondaryFixed: Color(0xffd8e2ff),
      onSecondaryFixed: Color(0xff001a41),
      secondaryFixedDim: Color(0xffadc7ff),
      onSecondaryFixedVariant: Color(0xff2a4678),
      tertiaryFixed: Color(0xffc0e8ff),
      onTertiaryFixed: Color(0xff001e2b),
      tertiaryFixedDim: Color(0xff8dcff1),
      onTertiaryFixedVariant: Color(0xff004d66),
      surfaceDim: Color(0xff0d0d0d),
      surfaceBright: Color(0xff363636),
      surfaceContainerLowest: Color(0xff090909),
      surfaceContainerLow: Color(0xff181818),
      surfaceContainer: Color(0xff1f1f1f),
      surfaceContainerHigh: Color(0xff272727),
      surfaceContainerHighest: Color(0xff313131),
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
