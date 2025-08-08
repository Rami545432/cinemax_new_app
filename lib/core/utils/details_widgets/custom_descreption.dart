import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/secondry_button.dart';

class CustomDescreption extends StatefulWidget {
  const CustomDescreption({super.key, required this.overview});
  final String overview;
  @override
  State<CustomDescreption> createState() => _CustomDescreptionState();
}

class _CustomDescreptionState extends State<CustomDescreption> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.overview == ''
            ? Text(
                'No Description Available',
                style: AppStyles.textStyle16(context),
              )
            : Text('Story Line :', style: AppStyles.textStyle18(context)),
        const SizedBox(height: 8),
        Text(
          maxLines: isClicked ? widget.overview.length : 2,
          overflow: isClicked ? TextOverflow.ellipsis : TextOverflow.visible,
          widget.overview,
          style: AppStyles.textStyle16(context),
        ),
        widget.overview.length > 100
            ? SecondaryButton(
                onTap: () {
                  setState(() {
                    isClicked = !isClicked;
                  });
                },
                text: isClicked ? 'Less' : 'More',
                style: AppStyles.textStyle18(context).copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppPrimaryColors.blueAccent,
                ),
              )
            : Text(''),
      ],
    );
  }
}
