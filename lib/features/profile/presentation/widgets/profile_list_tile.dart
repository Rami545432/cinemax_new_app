import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movify/core/utils/app_colors.dart';
import 'package:movify/core/utils/app_styles.dart';
import 'package:movify/features/profile/presentation/widgets/profile_auth_action_button.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.avatarImage,
    required this.authButtonText,
    required this.onAuthButtonPressed,
    this.deleteButtonText,
    this.onDeleteButtonPressed,
  });
  final String title;
  final String subtitle;
  final String avatarImage;
  final String authButtonText;
  final VoidCallback onAuthButtonPressed;
  final String? deleteButtonText;
  final VoidCallback? onDeleteButtonPressed;

  @override
  Widget build(BuildContext context) {
    final style = AppStyles.textStyle16(context);

    return Column(
      spacing: 20,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: CachedNetworkImageProvider(avatarImage),
          ),
          title: Text(title, style: style),
          subtitle: Text(subtitle, style: style),
        ),
        ProfileAuthActionButton(
          onAuthButtonPressed: onAuthButtonPressed,
          authButtonText: authButtonText,
          buttonColor: AppPrimaryColors.blueAccent,
        ),
        if (deleteButtonText != null && onDeleteButtonPressed != null)
          ProfileAuthActionButton(
            onAuthButtonPressed: onDeleteButtonPressed!,
            authButtonText: deleteButtonText!,
            buttonColor: Colors.red,
          ),
      ],
    );
  }
}
