import 'package:cinemax_app_new/core/routing/route_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_colors.dart';
import 'app_styles.dart';
import 'secondry_button.dart';

class TextAndButtonRow extends StatelessWidget {
  const TextAndButtonRow({
    super.key,
    required this.text,
    required this.buttonText,
    this.onTap,
  });
  final String text, buttonText;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: AppStyles.textStyle16(
            context,
          ).copyWith(fontFamily: 'Poppins', color: Colors.grey),
        ),
        SizedBox(width: 5),
        SecondaryButton(
          onTap: () {
            context.pushNamed(RouteName.signIn);
          },
          text: buttonText,
          style: AppStyles.textStyle16(
            context,
          ).copyWith(color: AppPrimaryColors.blueAccent),
        ),
      ],
    );
  }
}
