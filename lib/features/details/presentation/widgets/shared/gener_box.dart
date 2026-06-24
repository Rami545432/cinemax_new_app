import 'package:flutter/material.dart';
import 'package:movify/core/utils/app_styles.dart';

class GenerBox extends StatelessWidget {
  const GenerBox({super.key, required this.gener});

  final String? gener;

  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.grey.shade700),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Text(
        gener ?? '',
        textAlign: TextAlign.center,
        style: AppStyles.textStyle18(context),
      ),
    ),
  );
}
