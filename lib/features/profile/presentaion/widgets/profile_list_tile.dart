import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinemax_app_new/constant.dart';
import 'package:cinemax_app_new/core/routing/route_name.dart';
import 'package:cinemax_app_new/core/utils/app_colors.dart';
import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/features/auth/presentation/views_models/cubit/auth_cubit.dart';
import 'package:cinemax_app_new/features/auth/presentation/views_models/cubit/auth_state.dart';
import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (BuildContext context, AuthState state) {
        if (state is AuthAuthenticated) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                _ProfileListTile(
                  title: state.user.displayName ?? '',
                  subtitle: state.user.email ?? '',
                  avatarImage: state.user.photoUrl ?? '',
                  authButtonText: l10n.authLogout,
                  onAuthButtonPressed: () {
                    context.read<AuthCubit>().signOut();
                  },
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.edit_outlined),
                  ),
                ),
              ],
            ),
          );
        }
        return _ProfileListTile(
          title: l10n.myProfile,
          subtitle: l10n.signInHint,
          avatarImage: defaultProfileImage,
          trailing: null,
          authButtonText: l10n.authLogin,
          onAuthButtonPressed: () {
            context.pushNamed(RouteName.initialAuth);
          },
        );
      },
    );
  }
}

class _ProfileListTile extends StatelessWidget {
  const _ProfileListTile({
    required this.title,
    required this.subtitle,
    required this.avatarImage,
    required this.trailing,
    required this.authButtonText,
    required this.onAuthButtonPressed,
  });
  final String title;
  final String subtitle;
  final String avatarImage;
  final Widget? trailing;
  final String authButtonText;
  final Function() onAuthButtonPressed;

  @override
  Widget build(BuildContext context) {
    final style = AppStyles.textStyle16(context);
    return Column(
      spacing: 20,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: CachedNetworkImageProvider(avatarImage),
          ),
          title: Text(title, style: style),
          subtitle: Text(subtitle, style: style),
          trailing: trailing,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppPrimaryColors.blueAccent),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextButton(
                onPressed: onAuthButtonPressed,

                child: Text(
                  authButtonText,
                  style: style.copyWith(color: AppPrimaryColors.blueAccent),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
