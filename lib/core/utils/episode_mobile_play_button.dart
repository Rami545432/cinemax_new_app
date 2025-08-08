import 'package:flutter/material.dart';

import '../../features/search/presentaion/view_models/widgets/icon_text_row.dart';
import 'app_colors.dart';

class EpisodeMobilePlayButton extends StatelessWidget {
  const EpisodeMobilePlayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 6,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: AppPrimaryColors.blueAccent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: IconTextRow(
            iconData: Icons.play_arrow_rounded,
            text: 'Play ',
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
