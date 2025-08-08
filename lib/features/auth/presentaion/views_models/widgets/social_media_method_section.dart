import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants/assets.dart';
import '../manger/social_media_sign_up_cubit/social_media_sign_up_cubit.dart';
import 'social_media_icon.dart';

class SocialMediaMethodSection extends StatelessWidget {
  const SocialMediaMethodSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SocialMediaIcon(
          image: Assets.imagesGoogle,
          onTap: () async {
            await BlocProvider.of<SocialMediaSignUpCubit>(context)
                .signInWithGoolge();
          },
        ),
        SocialMediaIcon(
          image: Assets.imagesFacebook,
          onTap: () async {
            await BlocProvider.of<SocialMediaSignUpCubit>(context)
                .signInWithFacebook();
          },
        )
      ],
    );
  }
}
