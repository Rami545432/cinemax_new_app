import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class DetailInfo extends StatelessWidget {
  const DetailInfo({
    super.key,
    required this.info,
    required this.icons,
    required this.text,
  });
  final String info;
  final IconData icons;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icons, color: Colors.white),
        Text(text, style: AppStyles.textStyle16(context)),
        Text(info, style: AppStyles.textStyle16(context)),
      ],
    );
  }
}
