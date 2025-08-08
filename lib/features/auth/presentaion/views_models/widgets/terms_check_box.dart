import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import 'pirvacy_policy_texts.dart';

class TermsCheckBox extends StatefulWidget {
  const TermsCheckBox({super.key, required this.globalKey});
  final GlobalKey<FormState> globalKey;
  @override
  State<TermsCheckBox> createState() => _TermsCheckBoxState();
}

class _TermsCheckBoxState extends State<TermsCheckBox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
          checkColor: Colors.white,
          activeColor: AppPrimaryColors.blueAccent,
          value: isChecked,
          onChanged: (value) {
            setState(() {
              if (widget.globalKey.currentState!.validate()) {}
              isChecked = value!;
            });
          },
        ),
        const TermsAndPolicyTexts()
      ],
    );
  }
}
