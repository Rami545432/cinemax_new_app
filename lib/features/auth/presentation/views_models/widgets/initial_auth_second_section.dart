import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/core/utils/helper/responsive_padding.dart';
import 'package:cinemax_app_new/core/utils/horizental_seprator.dart';
import 'package:flutter/material.dart';
import 'sign_up_methods.dart';

class InitialAuthSecondSection extends StatelessWidget {
  const InitialAuthSecondSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const HorizentalSeprator(),
            Padding(
              padding: getResponsivePadding(context, horizontal: 10),
              child: Text(
                'Or Sign up with ',
                style: AppStyles.textStyle14(
                  context,
                ).copyWith(color: const Color.fromARGB(255, 128, 128, 137)),
              ),
            ),
            const HorizentalSeprator(),
          ],
        ),
        const SizedBox(height: 40),
        Expanded(child: const SignUpMethods()),
      ],
    );
  }
}
