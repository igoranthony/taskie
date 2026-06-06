import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProjectFormHeader extends StatelessWidget {
  final bool isEditing;

  const ProjectFormHeader({super.key, required this.isEditing});

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
                  child: Icon(
                    Icons.arrow_back,
                    size: 18,
                    color: cs.onSurface,
                  ),
                ),
              ),
            ),
          ),
          Text(
            isEditing ? 'Editar Projeto' : 'Novo Projeto',
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
