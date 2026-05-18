import 'package:flutter/material.dart';
import 'package:movify/core/utils/app_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.lable,
    this.onFieldSubmitted,
    this.obscureText = false,
    this.icon,
    this.onPressed,
    this.controller,
  });
  final String hintText, lable;
  final ValueChanged<String>? onFieldSubmitted;
  final bool obscureText;
  final Widget? icon;
  final VoidCallback? onPressed;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) => TextFormField(
    controller: controller,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'This Field is  Required ';
      }
      return null;
    },
    obscureText: obscureText,
    onFieldSubmitted: (value) => onFieldSubmitted?.call(value),
    style: AppStyles.textStyle14(context),
    decoration: InputDecoration(
      suffixIcon: IconButton(
        onPressed: onPressed,
        icon: icon ?? const Text(''),
      ),
      hintText: hintText,
      label: Text(
        lable,
        style: AppStyles.textStyle14(context).copyWith(color: Colors.white),
      ),
      hintStyle: AppStyles.textStyle14(context),
      enabledBorder: borderPropreties(),
      focusedBorder: borderPropreties(),
      errorBorder: borderPropreties(),
      border: borderPropreties(),
    ),
  );

  OutlineInputBorder borderPropreties() => OutlineInputBorder(
    borderRadius: BorderRadius.circular(48),
    borderSide: const BorderSide(color: Color.fromARGB(255, 54, 67, 74)),
  );
}
