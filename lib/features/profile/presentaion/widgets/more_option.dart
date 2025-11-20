import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'container_profile_frame.dart';
import 'profile_option_container.dart';

class MoreOptions extends StatelessWidget {
  const MoreOptions({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> account = [
      'Legal And Policies',
      'Help & Feedback',
      'About Us',
    ];
    List<IconData> accountIcons = [
      Icons.shield,
      FontAwesomeIcons.circleQuestion,
      Icons.info,
    ];
    return ContainerProfileFrame(
      child: Padding(
        padding: const EdgeInsets.only(left: 18, top: 23, right: 18),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [Text('More', style: AppStyles.textStyle18(context))],
            ),
            const SizedBox(height: 24),
            for (int i = 0; i < account.length; i++) ...[
              ProfileOptionContainer(text: account[i], icon: accountIcons[i]),
              if (i < account.length - 1) const SizedBox(height: 25),
            ],
          ],
        ),
      ),
    );
  }
}
