import 'package:cinemax_app_new/features/home/presentation/widgets/card_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class BuildGridCard extends StatelessWidget {
  const BuildGridCard({super.key, required this.index, required this.poster});
  final int index;
  final String poster;

  @override
  Widget build(BuildContext context) {
    final gradients = [
      [const Color(0xFF9333EA), const Color(0xFFEC4899)], // Purple to Pink
      [const Color(0xFF2563EB), const Color(0xFF06B6D4)], // Blue to Cyan
      [const Color(0xFFF97316), const Color(0xFFDC2626)], // Orange to Red
      [const Color(0xFF059669), const Color(0xFF14B8A6)], // Green to Teal
      [const Color(0xFFEAB308), const Color(0xFFF97316)], // Yellow to Orange
      [const Color(0xFF6366F1), const Color(0xFF9333EA)], // Indigo to Purple
    ];
    return Animate(
      effects: [
        FadeEffect(
          delay: Duration(milliseconds: index * 100),
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
          curve: Curves.easeOut,
        ),
        SlideEffect(
          delay: Duration(milliseconds: index * 100),
          duration: 600.ms,
          begin: const Offset(0, 0.2),
          end: Offset.zero,
          curve: Curves.easeOut,
        ),
      ],
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.8),
              blurRadius: 40,
              offset: const Offset(0, 20),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Poster Image
              CardImage(imageUrl: poster),

              // Gradient Overlay
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      gradients[index][0].withValues(alpha: 0.6),
                      gradients[index][1].withValues(alpha: 0.8),
                    ],
                  ),
                ),
              ),

              // Shine Effect
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withValues(alpha: 0.1),
                      Colors.transparent,
                      Colors.transparent,
                    ],
                  ),
                ),
              ),

              // Heart Icon with pulsing animation
              Positioned(
                top: 8,
                right: 8,
                child: Animate(
                  onPlay: (controller) => controller.repeat(),
                  effects: [
                    ScaleEffect(
                      delay: Duration(milliseconds: index * 200),
                      duration: 1500.ms,
                      begin: const Offset(1.0, 1.0),
                      end: const Offset(1.2, 1.2),
                      curve: Curves.easeInOut,
                    ),
                  ],
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFEC4899).withValues(alpha: 0.6),
                          blurRadius: 8,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ),

              // Checkmark Badge with scale-in animation
              Positioned(
                bottom: 8,
                right: 8,
                child: Animate(
                  effects: [
                    ScaleEffect(
                      delay: Duration(milliseconds: (index * 100) + 400),
                      duration: 400.ms,
                      begin: Offset.zero,
                      end: const Offset(1.0, 1.0),
                      curve: Curves.easeOut,
                    ),
                    FadeEffect(
                      delay: Duration(milliseconds: (index * 100) + 400),
                      duration: 400.ms,
                      begin: 0.0,
                      end: 1.0,
                      curve: Curves.easeOut,
                    ),
                  ],
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xFF10B981),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ),

              // Floating heart particle for first card
              if (index == 0)
                Positioned(
                  top: -24,
                  left: 40,
                  child: Animate(
                    onPlay: (controller) => controller.repeat(reverse: true),
                    effects: [
                      MoveEffect(
                        duration: 2000.ms,
                        begin: Offset.zero,
                        end: const Offset(0, -8),
                        curve: Curves.easeInOut,
                      ),
                    ],
                    child: const Icon(
                      Icons.favorite,
                      color: Color(0xFFEC4899),
                      size: 20,
                    ),
                  ),
                ),

              if (index == 0)
                Positioned(
                  top: -32,
                  left: 20,
                  child: Animate(
                    onPlay: (controller) => controller.repeat(),
                    effects: [
                      FadeEffect(
                        duration: 3000.ms,
                        begin: 0.6,
                        end: 0.0,
                        curve: Curves.easeInOut,
                      ),
                      ScaleEffect(
                        duration: 3000.ms,
                        begin: const Offset(1.0, 1.0),
                        end: const Offset(1.5, 1.5),
                        curve: Curves.easeInOut,
                      ),
                    ],
                    child: const Icon(
                      Icons.favorite,
                      color: Color(0xFFFBCFE8),
                      size: 12,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
