import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_colors.dart';

class SmallIconButton extends StatelessWidget {
  const SmallIconButton({super.key, this.icon, this.onPressed});
  final Widget? icon;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: AppPrimaryColors.soft,
        borderRadius: BorderRadius.circular(16),
      ),
      child: IconButton(
        iconSize: 18,
        onPressed:
            onPressed ??
            () {
              GoRouter.of(context).pop();
            },
        icon: icon ?? const Text(''),
      ),
    );
  }
}
