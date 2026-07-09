import 'package:flutter/material.dart';
import 'package:movify/core/utils/app_styles.dart';
import 'package:movify/shared/presentation/widgets/size_config.dart';

class ProfileAuthActionButton extends StatelessWidget {
  const ProfileAuthActionButton({
    super.key,
    required this.onAuthButtonPressed,
    required this.authButtonText,
    required this.buttonColor,
  });

  final VoidCallback onAuthButtonPressed;
  final String authButtonText;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    final style = AppStyles.textStyle16(context);
    final width = MediaQuery.widthOf(context);
    final isMobile = width < SizeConfig.tablet;

    return GestureDetector(
      onTap: onAuthButtonPressed,
      child: SizedBox(
        height: isMobile ? 40 : 80,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: buttonColor),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                authButtonText,
                style: style.copyWith(color: buttonColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
