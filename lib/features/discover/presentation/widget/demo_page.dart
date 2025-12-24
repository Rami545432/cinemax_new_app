import 'dart:math' as math;
import 'dart:math';

import 'package:cinemax_app_new/config/animations/animation_config.dart';
import 'package:cinemax_app_new/config/animations/widgets/animated_card.dart';
import 'package:cinemax_app_new/config/animations/widgets/animated_list_item.dart';
import 'package:cinemax_app_new/config/animations/widgets/animated_page_transition.dart';
import 'package:cinemax_app_new/config/animations/widgets/shimmer_loading.dart';
import 'package:cinemax_app_new/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  bool isFavorite = false;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    animation = Tween<double>(begin: 1, end: 1.06).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Animate(
          effects: AppAnimations.errorShake,
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade700,
            ),
          ),
        ),
      ],
    );
  }
}
