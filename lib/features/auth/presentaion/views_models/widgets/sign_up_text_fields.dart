import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/functions/show_snack_bar.dart';
import '../../../../../core/utils/go_router.dart';
import '../manger/sign_up_cubit/sign_up_cubit.dart';
import 'sign_up_text_field_and_button.dart';

class SignUpTextFields extends StatelessWidget {
  const SignUpTextFields({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          GoRouter.of(context).pushReplacement(AppRouter.kSignInView);
          showSnackBar(
            context,
            color: Colors.greenAccent,
            text: ' Verification Code  Has Sent Please Verify Your Email ',
          );
        }
        if (state is SignUpFailure) {
          showSnackBar(
            context,
            color: Colors.redAccent,
            text: state.errorMessage,
          );
        }
      },
      child: SignUpTextFieldsAndButton(),
    );
  }
}
