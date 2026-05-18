import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movify/core/routing/route_name.dart';

class HomeIconButton extends StatelessWidget {
  const HomeIconButton({super.key});

  @override
  Widget build(BuildContext context) => IconButton(
    onPressed: () => context.goNamed(RouteName.home),
    icon: const Icon(Icons.home),
  );
}
