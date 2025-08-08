import 'package:cinemax_app_new/core/utils/go_router.dart';
import 'package:cinemax_app_new/features/auth/presentaion/views_models/manger/firebase_opreations_cubit/firebase_opreations_cubit.dart';
import 'package:cinemax_app_new/features/profile/presentaion/widgets/container_profile_frame.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_colors.dart';
import 'profile_image.dart';

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final fireBaseUser = FirebaseAuth.instance.currentUser;

    return ContainerProfileFrame(
      child: ListTile(
        onTap: () {
          GoRouter.of(context).push(AppRouter.kEditProfileView);
        },
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
        leading: const ProfileImage(height: 54, width: 54),
        title: BlocBuilder<FirebaseOpreationsCubit, FirebaseOpreationsState>(
          builder: (context, state) {
            return Text(
              fireBaseUser?.displayName.toString() == 'null'
                  ? ''
                  : fireBaseUser?.displayName.toString() ?? '',
            );
          },
        ),
        subtitle: Text(fireBaseUser?.uid.toString() ?? ''),
        trailing: GestureDetector(
          child: Icon(
            FontAwesomeIcons.penToSquare,
            color: AppPrimaryColors.blueAccent,
          ),
        ),
      ),
    );
  }
}
