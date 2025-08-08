import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_styles.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.text, this.onTap});
  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: SizedBox(
              width: constraints.maxWidth * 0.7,
              child: AspectRatio(
                aspectRatio: 327 / 60,
                child: Container(
                  // width: 327,
                  // height: 60,
                  decoration: BoxDecoration(
                    color: AppPrimaryColors.blueAccent,
                    borderRadius: BorderRadius.circular(128),
                  ),
                  child: Center(
                    child: Text(text, style: AppStyles.textStyle16(context)),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
