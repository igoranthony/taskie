import 'package:flutter/material.dart';

/// Wraps [Form] + scrollable [ListView] with standard padding and uniform
/// spacing between fields. Pass children in order — separators are inserted
/// automatically. To increase spacing before a specific child (e.g. the
/// submit button), add a [SizedBox] as the preceding child.
class AppFormBody extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final List<Widget> children;
  final EdgeInsetsGeometry padding;
  final double spacing;

  const AppFormBody({
    super.key,
    required this.formKey,
    required this.children,
    this.padding = const EdgeInsets.all(16),
    this.spacing = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView.separated(
        padding: padding,
        itemCount: children.length,
        separatorBuilder: (_, __) => SizedBox(height: spacing),
        itemBuilder: (_, i) => children[i],
      ),
    );
  }
}
