import 'package:cinemax_app_new/constants/assets.dart';
import 'package:cinemax_app_new/features/auth/presentation/cubits/login_cubit.dart';
import 'package:cinemax_app_new/features/auth/presentation/widgets/build_footer.dart';
import 'package:cinemax_app_new/features/auth/presentation/widgets/build_logo.dart';
import 'package:cinemax_app_new/features/auth/presentation/widgets/login_tagline.dart';
import 'package:cinemax_app_new/features/auth/presentation/widgets/social_login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 48),

          // Logo
          const Expanded(flex: 2, child: BuildLogo()),

          // Tagline
          const Expanded(child: LoginTagline()),

          // Google Sign In (PRIMARY for Android)
          SocialLoginButton(
            icon: Assets.iconsGoogle,
            title: 'Google',
            onTap: context.read<LoginCubit>().signInWithGoogle,
          ),

          const SizedBox(height: 12),

          const SizedBox(height: 32),

          // Log In link
          const SizedBox(height: 24),

          // Terms & Privacy
          const BuildFooter(),

          const SizedBox(height: 32),
        ],
      ),
    ),
  );
}
