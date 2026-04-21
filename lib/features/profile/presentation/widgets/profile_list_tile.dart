import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinemax_app_new/constant.dart';
import 'package:cinemax_app_new/core/routing/route_name.dart';
import 'package:cinemax_app_new/core/utils/app_colors.dart';
import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/features/auth/presentation/cubits/session_cubit.dart';
import 'package:cinemax_app_new/features/auth/presentation/cubits/session_state.dart';
import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:cinemax_app_new/shared/presentation/utils/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocBuilder<SessionCubit, SessionState>(
      builder: (context, state) {
        if (state is SessionAuthenticated) {
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
                    context.read<SessionCubit>().signOut();
                    showSnackBar(
                      context,
                      color: Colors.green,
                      text: 'Logout successfully',
                    );
                  },
                ),
              ],
            ),
          );
        }
        return _ProfileListTile(
          title: l10n.myProfile,
          subtitle: l10n.signInHint,
          avatarImage: Constants.defaultProfileImage,
          authButtonText: l10n.authLogin,
          onAuthButtonPressed: () {
            context.pushNamed(RouteName.login);
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
    required this.authButtonText,
    required this.onAuthButtonPressed,
  });
  final String title;
  final String subtitle;
  final String avatarImage;
  final String authButtonText;
  final VoidCallback onAuthButtonPressed;

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
        ),
        GestureDetector(
          onTap: onAuthButtonPressed,
          child: SizedBox(
            height: 40,
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(color: AppPrimaryColors.blueAccent),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    authButtonText,
                    style: style.copyWith(color: AppPrimaryColors.blueAccent),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
