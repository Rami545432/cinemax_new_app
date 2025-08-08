import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/go_router.dart';
import '../../../../../core/utils/main_app_bar.dart';
import '../../../../../core/utils/primary_button.dart';
import '../../../../../core/utils/text_button_row.dart';
import '../widgets/verfication_row.dart';

class VerifyAccountBody extends StatelessWidget {
  const VerifyAccountBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const MainAppBar(title: ''),
          const SizedBox(height: 40),
          Text(
            textAlign: TextAlign.center,
            'Verifying your account',
            style: AppStyles.textStyle24(context),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: 270,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'We have just sent you 4 digit code via your email',
                    style: AppStyles.textStyle14(
                      context,
                    ).copyWith(color: const Color(0xff7F7E83)),
                  ),
                  TextSpan(
                    text: ' example@gmail.com',
                    style: AppStyles.textStyle14(context),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),
          const VerficationRow(),
          const SizedBox(height: 64),
          PrimaryButton(
            text: 'Continue ',
            onTap: () {
              GoRouter.of(context).push(AppRouter.kNewPasswordView);
            },
          ),
          const SizedBox(height: 42),
          const TextAndButtonRow(
            text: 'Didn’t receive code?',
            buttonText: 'Resend',
          ),
        ],
      ),
    );
  }
}
