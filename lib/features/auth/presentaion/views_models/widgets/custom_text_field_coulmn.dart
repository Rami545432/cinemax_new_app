import 'package:flutter/material.dart';

import '../../../../../core/utils/custom_text_field.dart';

class CustomTextFieldCoulmn extends StatefulWidget {
  const CustomTextFieldCoulmn({
    super.key,
    required this.nameController,
    required this.passwordController,
    required this.emailController,
  });

  final TextEditingController nameController,
      passwordController,
      emailController;

  @override
  State<CustomTextFieldCoulmn> createState() => _CustomTextFieldCoulmnState();
}

class _CustomTextFieldCoulmnState extends State<CustomTextFieldCoulmn> {
  bool isVisiable = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24,
      children: [
        Expanded(
          child: CustomTextField(
            controller: widget.nameController,
            hintText: 'Enter your name',
            lable: 'Full name',
          ),
        ),
        Expanded(
          child: CustomTextField(
            controller: widget.emailController,
            hintText: 'Enter your email',
            lable: 'Email Address',
          ),
        ),
        Expanded(
          child: CustomTextField(
            controller: widget.passwordController,
            hintText: 'Enter Your Password',
            lable: 'Password',
            obscureText: isVisiable ? false : true,
            icon: isVisiable
                ? const Icon(Icons.visibility_rounded)
                : const Icon(Icons.visibility_off),
            onPressed: () {
              setState(
                () {
                  isVisiable = !isVisiable;
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
