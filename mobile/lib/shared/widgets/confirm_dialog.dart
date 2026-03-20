import 'package:flutter/material.dart';

class ConfirmDialog {
  ConfirmDialog._();

  static Future<bool> show(
    BuildContext context, {
    required String title,
    required String message,
    String confirmLabel = 'Confirmar',
    String cancelLabel = 'Cancelar',
    bool destructive = false,
  }) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (ctx) {
        final cs = Theme.of(ctx).colorScheme;
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: Text(cancelLabel),
            ),
            Semantics(
              label: '$confirmLabel - confirmar ação',
              child: FilledButton(
                onPressed: () => Navigator.pop(ctx, true),
                style: destructive
                    ? FilledButton.styleFrom(backgroundColor: cs.error)
                    : null,
                child: Text(confirmLabel),
              ),
            ),
          ],
        );
      },
    );
    return result ?? false;
  }
}
