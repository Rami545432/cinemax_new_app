import 'package:flutter/material.dart';
import 'package:movify/features/profile/core/profile_list_tile_list.dart';
import 'package:movify/features/profile/presentation/widgets/profile_container.dart';
import 'package:movify/features/profile/presentation/widgets/profile_list_tile.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 15,
        children: [
          const SizedBox(height: 12),
          const ProfileListTile(),

          ...profileListTileList(context).map(
            (e) =>
                ProfileContainer(title: e.title, icon: e.icon, onTap: e.onTap),
          ),
        ],
      ),
    ),
  );
}
