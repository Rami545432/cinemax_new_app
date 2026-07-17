import 'package:flutter/material.dart';
import 'package:movify/constants/assets.dart';
import 'package:movify/core/utils/app_styles.dart';

class BuildLogo extends StatelessWidget {
  const BuildLogo({super.key});

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Expanded(flex: 2, child: Image.asset(Assets.iconsAppIconForeground)),

      const SizedBox(height: 16),

      // App name
      Expanded(
        child: Text(
          'Movify',
          style: AppStyles.textStyle28(
            context,
          ).copyWith(fontWeight: FontWeight.w900),
        ),
      ),
    ],
  );
}
