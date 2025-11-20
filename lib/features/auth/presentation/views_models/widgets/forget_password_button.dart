import 'package:cinemax_app_new/core/routing/route_name.dart';
import 'package:cinemax_app_new/core/utils/app_colors.dart';
import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/core/utils/secondry_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SecondaryButton(
          text: 'Forgot Password ?',
          onTap: () {
            context.pushNamed(RouteName.resetPassword);
          },
          style: AppStyles.textStyle12(context).copyWith(
            color: AppPrimaryColors.blueAccent,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
