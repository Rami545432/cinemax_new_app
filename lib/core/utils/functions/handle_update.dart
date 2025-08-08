import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/auth/presentaion/views_models/manger/firebase_opreations_cubit/firebase_opreations_cubit.dart';

void handleUpdate(
    BuildContext context, List<TextEditingController> controllers) {
  if (controllers[0].text.isNotEmpty) {
    BlocProvider.of<FirebaseOpreationsCubit>(context)
        .updateDisplayName(controllers[0].text);
  }
  String newEmail = controllers[1].text;
  if (newEmail.isNotEmpty &&
      RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
          .hasMatch(newEmail)) {
    BlocProvider.of<FirebaseOpreationsCubit>(context).updateEmail(newEmail);
  }
}
