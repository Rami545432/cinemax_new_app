import 'package:flutter/material.dart';
import 'package:movify/core/utils/app_styles.dart';

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });
  final String title;
  final Icon icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => ListTile(
    contentPadding: EdgeInsets.zero,
    title: Text(title, style: AppStyles.textStyle16(context)),
    leading: icon,
    trailing: IconButton(
      onPressed: onTap,
      padding: EdgeInsets.zero,
      icon: const Icon(Icons.arrow_forward_ios_outlined),
    ),
    onTap: onTap,
  );
}
