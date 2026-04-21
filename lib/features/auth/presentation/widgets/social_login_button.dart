import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });
  final String icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final style = AppStyles.textStyle16(context);
    return ListTile(
      onTap: onTap,
      leading: SvgPicture.asset(icon, height: 36, width: 36),
      title: Text('Continue with $title', style: style, textAlign: .center),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(color: Colors.grey.shade800),
      ),
    );
  }
}
