import 'package:cinemax_app_new/core/routing/route_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeIconButton extends StatelessWidget {
  const HomeIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.goNamed(RouteName.home),
      icon: const Icon(Icons.home),
    );
  }
}
