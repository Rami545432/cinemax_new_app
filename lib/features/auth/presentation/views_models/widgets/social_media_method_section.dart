import 'package:cinemax_app_new/features/auth/presentation/views_models/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants/assets.dart';
import 'social_media_icon.dart';

class SocialMediaMethodSection extends StatelessWidget {
  const SocialMediaMethodSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SocialMediaIcon(
          image: Assets.imagesGoogle,
          onTap: () async {
            await context.read<AuthCubit>().signInWithGoogle();
          },
        ),
        SocialMediaIcon(
          image: Assets.imagesFacebook,
          onTap: () async {
            await context.read<AuthCubit>().signInWithFacebook();
          },
        ),
      ],
    );
  }
}
