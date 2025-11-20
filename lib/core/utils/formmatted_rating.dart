import 'package:flutter/material.dart';

class FormattedRating extends StatelessWidget {
  const FormattedRating({super.key, required this.rating});

  final num rating;

  @override
  Widget build(BuildContext context) {
    return Text(
      ' ${rating.toStringAsFixed(1)}',
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.white, // Ensure readability
      ),
    );
  }
}
