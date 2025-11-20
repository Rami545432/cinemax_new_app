import 'package:cinemax_app_new/core/routing/route_name.dart';
import 'package:cinemax_app_new/core/utils/animations/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeIconButton extends StatelessWidget {
  const HomeIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      entranceAnimation: ButtonAnimationType.scale,
      pressAnimation: ButtonAnimationType.ripple,
      entranceDelay: const Duration(seconds: 1),
      animationDuration: const Duration(seconds: 1),
      autoAnimate: true,
      onPressed: () => context.goNamed(RouteName.home),
      child: const Icon(Icons.home),
    );
  }
}
