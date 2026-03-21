import 'package:flutter/material.dart';

class AppSnackbar {
  AppSnackbar._();

  static void success(BuildContext context, String message) {
    final cs = Theme.of(context).colorScheme;
    _show(context,
        message: message,
        backgroundColor: cs.primary,
        foregroundColor: cs.onPrimary,
        icon: Icons.check_circle_outline);
  }

  static void error(BuildContext context, String message) {
    final cs = Theme.of(context).colorScheme;
    _show(context,
        message: message,
        backgroundColor: cs.error,
        foregroundColor: cs.onError,
        icon: Icons.error_outline);
  }

  static void warning(BuildContext context, String message) {
    final cs = Theme.of(context).colorScheme;
    _show(context,
        message: message,
        backgroundColor: cs.tertiaryContainer,
        foregroundColor: cs.onTertiaryContainer,
        icon: Icons.warning_amber_rounded);
  }

  static void info(BuildContext context, String message) {
    final cs = Theme.of(context).colorScheme;
    _show(context,
        message: message,
        backgroundColor: cs.secondary,
        foregroundColor: cs.onSecondary,
        icon: Icons.info_outline);
  }

  static void _show(
    BuildContext context, {
    required String message,
    required Color backgroundColor,
    required Color foregroundColor,
    required IconData icon,
  }) {
    if (!context.mounted) return;

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(icon, color: foregroundColor, size: 18),
              const SizedBox(width: 8),
              Expanded(
                child: Text(message, style: TextStyle(color: foregroundColor)),
              ),
            ],
          ),
          backgroundColor: backgroundColor,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      );
  }
}
