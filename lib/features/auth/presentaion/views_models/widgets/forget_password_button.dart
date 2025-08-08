import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/go_router.dart';
import '../../../../../core/utils/secondry_button.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SecondaryButton(
          text: 'Forgot Password ?',
          onTap: () {
            GoRouter.of(context).push(AppRouter.kResetPasswordView);
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
