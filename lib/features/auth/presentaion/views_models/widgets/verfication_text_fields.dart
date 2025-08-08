import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class VerficationTextField extends StatelessWidget {
  const VerficationTextField({super.key});
  final bool last = false;
  final bool first = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      width: 64,
      child: TextFormField(
        showCursor: false,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty) {
            FocusScope.of(context).previousFocus();
          }
        },
        keyboardType: TextInputType.number,
        cursorColor: AppPrimaryColors.blueAccent,
        textAlign: TextAlign.center,
        style: AppStyles.textStyle28(context).copyWith(fontFamily: 'Poppins'),
        maxLength: 1,
        buildCounter:
            (
              context, {
              required currentLength,
              required isFocused,
              required maxLength,
            }) {
              return const SizedBox.shrink();
            },
        decoration: InputDecoration(
          fillColor: AppPrimaryColors.soft,
          filled: true,
          enabledBorder: borderProperties(AppPrimaryColors.soft),
          focusedBorder: borderProperties(AppPrimaryColors.blueAccent),
        ),
      ),
    );
  }

  OutlineInputBorder borderProperties(Color color) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: color),
  );
}
