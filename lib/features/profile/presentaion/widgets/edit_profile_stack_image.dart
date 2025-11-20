import 'package:cinemax_app_new/core/utils/app_colors.dart';
import 'package:cinemax_app_new/core/utils/small_icon_button.dart';
import 'package:flutter/material.dart';

import 'profile_image.dart';

class EditProfileStackImage extends StatelessWidget {
  const EditProfileStackImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          const ProfileImage(width: 72, height: 72),
          Positioned(
            top: 40,
            left: 42,
            child: SmallIconButton(
              icon: Icon(
                Icons.edit,
                color: AppPrimaryColors.blueAccent,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
