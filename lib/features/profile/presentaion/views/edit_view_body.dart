import 'dart:developer';

import 'package:cinemax_app_new/core/utils/functions/show_snack_bar.dart';
import 'package:cinemax_app_new/features/auth/presentaion/views_models/manger/firebase_opreations_cubit/firebase_opreations_cubit.dart';
import 'package:cinemax_app_new/features/profile/presentaion/widgets/edit_profile_list_view_componets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constant.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key});

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  final List<TextEditingController> controllers = [];
  @override
  void initState() {
    for (int i = 0; i < 3; i++) {
      controllers.add(TextEditingController());
    }
    super.initState();
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> hintTexts = [
      fireBaseUser.currentUser!.displayName.toString(),
      fireBaseUser.currentUser!.email.toString(),
      fireBaseUser.currentUser!.phoneNumber.toString(),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: BlocConsumer<FirebaseOpreationsCubit, FirebaseOpreationsState>(
        listener: (context, state) {
          if (state is FirebaseOpreationsSuccess) {
            for (int i = 0; i < hintTexts.length; i++) {
              hintTexts[i] = controllers[i].text;
            }
            if (controllers[1].text.isNotEmpty) {
              showSnackBar(
                context,
                color: Colors.greenAccent,
                text: 'Please Check Your Email to Update it ',
              );
            }
            showSnackBar(
              context,
              color: Colors.greenAccent,
              text: 'Your Data Has updated  !',
            );
          }
          if (state is FirebaseOpreationsFailure) {
            log(state.errMessage);
          }
        },
        builder: (context, state) {
          return EditProfileListViewComponets(
            controllers: controllers,
            hintTexts: hintTexts,
          );
        },
      ),
    );
  }
}
