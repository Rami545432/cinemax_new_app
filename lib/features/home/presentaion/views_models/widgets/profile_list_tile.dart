import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_styles.dart';
import '../../../../../../core/utils/navigation_views.dart';
import '../../../../../../core/utils/small_icon_button.dart';
import '../../../../../../features/profile/presentaion/widgets/profile_image.dart';
import 'profile_list_tile_bloc_builder.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return NavigationViews(viewindex: 3);
            },
          ),
        );
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
      title: ProfileListTileBLocBuilder(),
      leading: const ProfileImage(width: 54, height: 54),
      subtitle: Text(
        'Let’s stream your favorite movie',
        style: AppStyles.textStyle12(context),
      ),
      trailing: SmallIconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return NavigationViews(viewindex: 1);
              },
            ),
          );
        },
        icon: const Icon(Icons.favorite, color: Colors.red),
      ),
    );
  }
}
