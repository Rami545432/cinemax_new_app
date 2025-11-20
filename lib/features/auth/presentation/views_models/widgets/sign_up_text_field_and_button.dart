import 'package:cinemax_app_new/features/auth/presentation/views_models/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/primary_button.dart';
import 'custom_text_field_coulmn.dart';

class SignUpTextFieldsAndButton extends StatefulWidget {
  const SignUpTextFieldsAndButton({super.key});

  @override
  State<SignUpTextFieldsAndButton> createState() =>
      _SignUpTextFieldsAndButtonState();
}

class _SignUpTextFieldsAndButtonState extends State<SignUpTextFieldsAndButton> {
  GlobalKey<FormState> globalKey = GlobalKey();
  late TextEditingController emailController,
      passowordController,
      nameController;
  @override
  void initState() {
    emailController = TextEditingController();
    passowordController = TextEditingController();
    nameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passowordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: CustomTextFieldCoulmn(
              emailController: emailController,
              nameController: nameController,
              passwordController: passowordController,
            ),
          ),
          const SizedBox(height: 16),
          const SizedBox(height: 40),
          Expanded(
            child: PrimaryButton(
              text: 'Sign Up',
              onTap: () async {
                if (globalKey.currentState!.validate()) {
                  await BlocProvider.of<AuthCubit>(context).signUpWithEmail(
                    email: emailController.text,
                    password: passowordController.text,
                    displayName: nameController.text,
                  );
                }
              },
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
