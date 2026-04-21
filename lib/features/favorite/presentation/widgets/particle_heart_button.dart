import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ParticleHeartButton extends HookWidget {
  final bool isFavorited;
  final VoidCallback onTap;
  final double size;

  const ParticleHeartButton({
    super.key,
    required this.isFavorited,
    required this.onTap,
    this.size = 32,
  });

  @override
  Widget build(BuildContext context) {
    // ✅ Auto-managed animation controllers (no dispose needed!)
    final scaleController = useAnimationController(
      duration: const Duration(milliseconds: 200),
    );

    final particleController = useAnimationController(
      duration: const Duration(milliseconds: 600),
    );

    // ✅ Create animations
    final scaleAnimation = useMemoized(
      () => Tween<double>(begin: 1.0, end: 1.2).animate(
        CurvedAnimation(parent: scaleController, curve: Curves.easeOut),
      ),
      [scaleController],
    );

    // ✅ Auto-trigger animations when isFavorited changes
    final prevIsFavorited = usePrevious(isFavorited);

    useEffect(() {
      if (isFavorited && prevIsFavorited == false) {
        scaleController.forward().then((_) => scaleController.reverse());
        particleController.forward(from: 0);
      }
      return null;
    }, [isFavorited]);

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: size * 2,
        height: size * 2,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Particles
            if (isFavorited)
              ...List.generate(8, (index) {
                final angle = (index * 45) * (3.14159 / 180);
                return AnimatedBuilder(
                  animation: particleController,
                  builder: (context, child) {
                    final offset = Offset(
                      cos(angle) * 30 * particleController.value,
                      sin(angle) * 30 * particleController.value,
                    );
                    return Transform.translate(
                      offset: offset,
                      child: Opacity(
                        opacity: 1 - particleController.value,
                        child: Container(
                          width: 4,
                          height: 4,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),

            // Heart icon
            ScaleTransition(
              scale: scaleAnimation,
              child: Icon(
                isFavorited ? Icons.favorite : Icons.favorite_border,
                color: isFavorited ? Colors.red : Colors.grey,
                size: size,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
