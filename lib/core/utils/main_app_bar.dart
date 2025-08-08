import 'package:flutter/material.dart';

import 'app_styles.dart';
import 'small_icon_button.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({super.key, required this.title, this.onPressed, this.icon});
  final String title;
  final VoidCallback? onPressed;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SmallIconButton(
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
          ),
          Text(
            title,
            style: AppStyles.textStyle16(context),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          IconButton(onPressed: onPressed, icon: icon ?? const Text('')),
        ],
      ),
    );
  }
}
