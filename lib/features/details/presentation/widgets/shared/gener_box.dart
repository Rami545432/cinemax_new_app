import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class GenerBox extends StatelessWidget {
  const GenerBox({super.key, required this.gener});

  final String? gener;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade700),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(
          gener ?? '',
          textAlign: TextAlign.center,
          style: AppStyles.textStyle18(context),
        ),
      ),
    );
  }
}
