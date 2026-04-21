import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class BuildFooter extends StatelessWidget {
  const BuildFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final style = AppStyles.textStyle16(
      context,
    ).copyWith(color: const Color(0xFFA3A3A3));
    return Text.rich(
      TextSpan(
        style: AppStyles.textStyle16(
          context,
        ).copyWith(color: const Color(0xFFA3A3A3)),
        children: [
          const TextSpan(text: 'By continuing, you agree to our '),
          WidgetSpan(
            child: GestureDetector(
              onTap: () {
                // Navigate to Terms
              },
              child: Text(
                'Terms',
                style: style.copyWith(decoration: TextDecoration.underline),
              ),
            ),
          ),
          TextSpan(text: ' and ', style: style),
          WidgetSpan(
            child: GestureDetector(
              onTap: () {
                // Navigate to Privacy
              },
              child: Text(
                'Privacy Policy',
                style: style.copyWith(decoration: TextDecoration.underline),
              ),
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
