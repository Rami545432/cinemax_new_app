import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/secondry_button.dart';

class TermsAndPolicyTexts extends StatelessWidget {
  const TermsAndPolicyTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('I agree to the ', style: AppStyles.textStyle12(context)),
            SecondaryButton(
              text: 'Terms And Services',
              style: AppStyles.textStyle12(context).copyWith(
                color: AppPrimaryColors.blueAccent,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text('and ', style: AppStyles.textStyle12(context)),
            SecondaryButton(
              text: 'Privacy Policy',
              style: AppStyles.textStyle12(context).copyWith(
                color: AppPrimaryColors.blueAccent,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
