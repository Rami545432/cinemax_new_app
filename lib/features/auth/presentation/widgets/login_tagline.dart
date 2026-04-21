import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class LoginTagline extends StatelessWidget {
  const LoginTagline({super.key});

  @override
  Widget build(BuildContext context) => Column(
    spacing: 12,
    children: [
      Text(
        'Sign to Save your favorite movies',
        style: AppStyles.textStyle24(
          context,
        ).copyWith(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      Text(
        'And to Share your Reviews',
        style: AppStyles.textStyle20(
          context,
        ).copyWith(fontWeight: FontWeight.w400),
        textAlign: TextAlign.center,
      ),
    ],
  );
}
