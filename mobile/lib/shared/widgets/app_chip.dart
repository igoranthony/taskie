import 'package:flutter/material.dart';

/// Generic colored chip used by status and priority badges.
/// [color] drives background (10% opacity), border (30% opacity), and avatar.
class AppChip extends StatelessWidget {
  final String label;
  final Color color;
  final Widget? leading;

  const AppChip({
    super.key,
    required this.label,
    required this.color,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: leading,
      label: Text(label),
      backgroundColor: color.withValues(alpha: 0.1),
      side: BorderSide(color: color.withValues(alpha: 0.3)),
      padding: EdgeInsets.zero,
      labelPadding: const EdgeInsets.symmetric(horizontal: 4),
    );
  }
}
