import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../auth/presentaion/views_models/manger/firebase_opreations_cubit/firebase_opreations_cubit.dart';

class ProfileListTileBLocBuilder extends StatelessWidget {
  const ProfileListTileBLocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FirebaseOpreationsCubit, FirebaseOpreationsState>(
      builder: (context, state) {
        final fireBaseUser = FirebaseAuth.instance;
        if (state is FirebaseOpreationsSuccess) {
          return Text(
            fireBaseUser.currentUser?.displayName.toString() ?? '',
            style: AppStyles.textStyle16(context),
          );
        }
        return Text(
          fireBaseUser.currentUser?.displayName.toString() ?? '',
          style: AppStyles.textStyle16(context),
        );
      },
    );
  }
}
