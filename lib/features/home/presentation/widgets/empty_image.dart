import 'package:cinemax_app_new/core/utils/app_colors.dart';
import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class EmptyImage extends StatelessWidget {
  const EmptyImage({super.key});

  @override
  Widget build(BuildContext context) => Center(
    child: SizedBox(
      width: 150,
      height: 350,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppPrimaryColors.dark,
        ),
        child: Center(
          child: Text(
            'Movify',
            style: AppStyles.textStyle24(
              context,
            ).copyWith(color: Colors.white.withValues(alpha: 0.5)),
          ),
        ),
      ),
    ),
  );
}
