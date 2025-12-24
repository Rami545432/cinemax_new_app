import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class GenreContainer extends StatelessWidget {
  const GenreContainer({super.key, required this.name});

  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Theme.of(context).colorScheme.onSurface),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(name, style: AppStyles.textStyle16(context)),
      ),
    );
  }
}
