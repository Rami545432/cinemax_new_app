import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinemax_app_new/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key, required this.width, required this.height});
  final double width, height;
  @override
  Widget build(BuildContext context) {
    final String userImageUrl =
        FirebaseAuth.instance.currentUser?.photoURL.toString() ??
        defaultProfileImage;
    return SizedBox(
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: CachedNetworkImage(
          imageUrl: userImageUrl,
          errorWidget: (context, url, error) {
            return CachedNetworkImage(imageUrl: defaultProfileImage);
          },
        ),
      ),
    );
  }
}
