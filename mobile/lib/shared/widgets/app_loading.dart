import 'package:flutter/material.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 2.5,
        color: cs.primary,
      ),
    );
  }
}
