import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });
  final String title;
  final IconData icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: AppStyles.textStyle16(context)),
      leading: Icon(icon),
      trailing: IconButton(
        onPressed: onTap,
        padding: EdgeInsets.zero,
        icon: Icon(Icons.arrow_forward_ios_outlined),
      ),
      onTap: onTap,
    );
  }
}
