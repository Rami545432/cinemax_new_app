import 'package:cinemax_app_new/core/utils/app_colors.dart';
import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ProfileOptionContainer extends StatelessWidget {
  const ProfileOptionContainer({
    super.key,
    required this.text,
    this.icon,
    this.onTap,
  });
  final String text;
  final IconData? icon;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        width: 294,
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xff252836))),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 23),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icon, color: Colors.grey),
                  const SizedBox(width: 22),
                  Text(
                    text,
                    style: AppStyles.textStyle14(
                      context,
                    ).copyWith(color: Colors.white),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios_outlined,
                color: AppPrimaryColors.blueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
