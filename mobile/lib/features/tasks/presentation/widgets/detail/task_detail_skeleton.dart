import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TaskDetailSkeleton extends StatelessWidget {
  const TaskDetailSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final c = cs.surfaceContainerHighest;

    return Skeletonizer(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Priority bar ─────────────────────────────────────
            Row(
              children: [
                Container(
                  width: 3,
                  height: 13,
                  decoration: BoxDecoration(
                    color: c,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 90,
                  height: 10,
                  decoration: BoxDecoration(
                    color: c,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // ── Title ────────────────────────────────────────────
            Container(
              width: double.infinity,
              height: 28,
              decoration: BoxDecoration(
                color: c,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: 220,
              height: 28,
              decoration: BoxDecoration(
                color: c,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            const SizedBox(height: 16),
            // ── Status chip ──────────────────────────────────────
            Container(
              width: 110,
              height: 30,
              decoration: BoxDecoration(
                color: c,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            const SizedBox(height: 28),
            // ── Description label ────────────────────────────────
            Container(
              width: 80,
              height: 10,
              decoration: BoxDecoration(
                color: c,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 12,
              decoration: BoxDecoration(
                color: c,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(height: 6),
            Container(
              width: double.infinity,
              height: 12,
              decoration: BoxDecoration(
                color: c,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(height: 6),
            Container(
              width: 180,
              height: 12,
              decoration: BoxDecoration(
                color: c,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(height: 28),
            Divider(color: cs.outlineVariant, height: 1),
            const SizedBox(height: 20),
            // ── Meta grid row 1 ──────────────────────────────────
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _MetaCellSkeleton(color: c)),
                const SizedBox(width: 16),
                Expanded(child: _MetaCellSkeleton(color: c)),
              ],
            ),
            const SizedBox(height: 20),
            // ── Meta grid row 2 ──────────────────────────────────
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _MetaCellSkeleton(color: c)),
                const SizedBox(width: 16),
                Expanded(child: _MetaCellSkeleton(color: c)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MetaCellSkeleton extends StatelessWidget {
  final Color color;

  const _MetaCellSkeleton({required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 60,
          height: 9,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        const SizedBox(height: 6),
        Container(
          width: 100,
          height: 14,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ],
    );
  }
}
