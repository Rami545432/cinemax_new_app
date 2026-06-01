import 'package:flutter/material.dart';

class AvatarPlaceholder extends StatelessWidget {
  final String name;

  const AvatarPlaceholder({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    final firstLetter = name.isNotEmpty ? name[0].toUpperCase() : 'A';

    // Curated elegant gradients for modern fallback profile pictures
    final gradientColors = [
      [const Color(0xFF2563EB), const Color(0xFF3B82F6)], // Blue Accent
      [const Color(0xFF10B981), const Color(0xFF059669)], // Green
      [const Color(0xFFF59E0B), const Color(0xFFD97706)], // Orange/Amber
      [const Color(0xFFEF4444), const Color(0xFFDC2626)], // Red
      [const Color(0xFF8B5CF6), const Color(0xFF7C3AED)], // Purple
      [const Color(0xFFEC4899), const Color(0xFFDB2777)], // Pink
    ];

    final colorPair = gradientColors[name.hashCode % gradientColors.length];

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colorPair,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        firstLetter,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}
