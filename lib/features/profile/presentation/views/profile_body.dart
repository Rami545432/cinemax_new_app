import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movify/core/di/service_locator.dart';
import 'package:movify/features/profile/core/profile_list_tile_list.dart';
import 'package:movify/features/profile/presentation/cubits/notification_settings/notification_settings_cubit.dart';
import 'package:movify/features/profile/presentation/widgets/notification_switch_tile.dart';
import 'package:movify/features/profile/presentation/widgets/profile_container.dart';
import 'package:movify/features/profile/presentation/widgets/profile_list_tile_bloc_builder.dart';

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
          const ProfileListTileBlocBuilder(),

          ...profileListTileList(context).map(
            (e) =>
                ProfileContainer(title: e.title, icon: e.icon, onTap: e.onTap),
          ),

          BlocProvider(
            create: (context) => getIt<NotificationSettingsCubit>(),
            child: const NotificationSwitchTile(),
          ),
        ],
      ),
    ),
  );
}
