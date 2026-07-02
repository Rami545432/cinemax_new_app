import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movify/core/utils/app_colors.dart';
import 'package:movify/core/utils/app_styles.dart';

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
        GestureDetector(
          onTap: onAuthButtonPressed,
          child: SizedBox(
            height: 40,
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(color: AppPrimaryColors.blueAccent),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    authButtonText,
                    style: style.copyWith(color: AppPrimaryColors.blueAccent),
                  ),
                ),
              ),
            ),
          ),
        ),
        if (deleteButtonText != null && onDeleteButtonPressed != null)
          GestureDetector(
            onTap: onDeleteButtonPressed,
            child: SizedBox(
              height: 40,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      deleteButtonText!,
                      style: style.copyWith(color: Colors.red),
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
