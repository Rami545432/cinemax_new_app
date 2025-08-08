import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/utils/go_router.dart';
import '../../../../core/utils/main_app_bar.dart';
import '../../../../core/utils/primary_button.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ListView(
        children: [
          const MainAppBar(title: 'Profile'),

          PrimaryButton(
            text: 'Log out',
            onTap: () async {
              // BlocProvider.of<GetFavoritesCubit>(context).clearCache();

              GoRouter.of(context).pushReplacement(AppRouter.kInitialAuth);

              await FirebaseAuth.instance.signOut();
              await GoogleSignIn().signOut();
              await FacebookAuth.instance.logOut();
              // ignore: use_build_context_synchronously
            },
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
