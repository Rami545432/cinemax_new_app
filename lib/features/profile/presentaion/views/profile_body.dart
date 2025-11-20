import 'package:cinemax_app_new/features/profile/core/profile_list_tile_list.dart';
import 'package:cinemax_app_new/features/profile/presentaion/widgets/profile_container.dart';
import 'package:cinemax_app_new/features/profile/presentaion/widgets/profile_list_tile.dart';
import 'package:flutter/material.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 15,
          children: [
            SizedBox(height: 12),
            const ProfileListTile(),

            ...profileListTileList(context).map(
              (e) => ProfileContainer(
                title: e.title,
                icon: e.icon,
                onTap: e.onTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
