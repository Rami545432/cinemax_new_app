import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/core/utils/custom_text_field.dart';
import 'package:cinemax_app_new/core/utils/main_app_bar.dart';
import 'package:cinemax_app_new/core/utils/primary_button.dart';
import 'package:flutter/material.dart';

class NewPasswordBody extends StatefulWidget {
  const NewPasswordBody({super.key});

  @override
  State<NewPasswordBody> createState() => _NewPasswordBodyState();
}

class _NewPasswordBodyState extends State<NewPasswordBody> {
  bool isVisiable = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const MainAppBar(title: ''),
          const SizedBox(height: 40),
          Text('Create new password', style: AppStyles.textStyle24(context)),
          const SizedBox(height: 7),
          Text(
            'Enter your new password',
            style: AppStyles.textStyle14(context).copyWith(color: Colors.grey),
          ),
          const SizedBox(height: 48),
          CustomTextField(
            icon: isVisiable
                ? const Icon(Icons.visibility_off_outlined)
                : const Icon(Icons.visibility_rounded),
            hintText: 'Enter new pasword',
            lable: 'New Password',
            onPressed: () {
              setState(() {
                isVisiable = !isVisiable;
              });
            },
            obscureText: isVisiable ? true : false,
          ),
          const SizedBox(height: 32),
          CustomTextField(
            icon: isVisiable
                ? const Icon(Icons.visibility_off_outlined)
                : const Icon(Icons.visibility_rounded),
            hintText: 'Confirm your Password',
            lable: 'Confirm Password',
            onPressed: () {
              setState(() {
                isVisiable = !isVisiable;
              });
            },
            obscureText: isVisiable ? true : false,
          ),
          const SizedBox(height: 40),
          const PrimaryButton(text: 'Reset'),
        ],
      ),
    );
  }
}
