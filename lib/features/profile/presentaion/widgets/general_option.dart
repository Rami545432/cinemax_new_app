import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'container_profile_frame.dart';
import 'profile_option_container.dart';

class GeneralOption extends StatelessWidget {
  const GeneralOption({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> general = [
      'Notification',
      'Language',
      'Country',
      'Clear Cache',
    ];
    List<IconData> generalIcons = [
      FontAwesomeIcons.bell,
      FontAwesomeIcons.globe,
      Icons.flag,
      FontAwesomeIcons.trash,
    ];
    return ContainerProfileFrame(
      child: Padding(
        padding: const EdgeInsets.only(left: 18, top: 23, right: 18),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('General', style: AppStyles.textStyle18(context)),
              ],
            ),
            const SizedBox(height: 24),
            for (int i = 0; i < general.length; i++) ...[
              ProfileOptionContainer(text: general[i], icon: generalIcons[i]),
              if (i < general.length - 1) const SizedBox(height: 16),
            ],
          ],
        ),
      ),
    );
  }
}
