import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/functions/show_snack_bar.dart';
import '../../../../../core/utils/go_router.dart';
import '../manger/social_media_sign_up_cubit/social_media_sign_up_cubit.dart';
import '../manger/social_media_sign_up_cubit/social_media_sign_up_state.dart';

import 'social_media_method_section.dart';

class SignUpMethods extends StatelessWidget {
  const SignUpMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SocialMediaSignUpCubit, SocialMediaSignUpState>(
      listener: (context, state) {
        if (state is SocialMediaSignUpSuccess) {
          GoRouter.of(context).pushReplacement(AppRouter.kNavigationView);
          showSnackBar(context, color: Colors.greenAccent, text: 'Welcome !');
        }
        if (state is SocialMediaSignUpFailure) {
          log(state.errorMessage);
          showSnackBar(context, color: Colors.red, text: state.errorMessage);
        }
      },
      child: SocialMediaMethodSection(),
    );
  }
}
