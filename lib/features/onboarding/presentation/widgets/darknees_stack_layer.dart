import 'package:flutter/material.dart';

class DarknessStackLayer extends StatelessWidget {
  const DarknessStackLayer({super.key});

  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.transparent, Theme.of(context).colorScheme.surface],
      ),
    ),
  );
}
