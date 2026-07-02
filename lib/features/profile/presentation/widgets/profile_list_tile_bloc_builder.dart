import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movify/constant.dart';
import 'package:movify/core/routing/route_name.dart';
import 'package:movify/core/utils/app_styles.dart';
import 'package:movify/features/auth/presentation/cubits/session_cubit.dart';
import 'package:movify/features/auth/presentation/cubits/session_state.dart';
import 'package:movify/features/profile/presentation/widgets/profile_list_tile.dart';
import 'package:movify/l10n/app_localizations.dart';
import 'package:movify/shared/presentation/utils/show_snack_bar.dart';

class ProfileListTileBlocBuilder extends StatelessWidget {
  const ProfileListTileBlocBuilder({super.key});

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
                ProfileListTile(
                  title: state.user.displayName ?? '',
                  subtitle: state.user.email ?? '',
                  avatarImage: state.user.photoUrl ?? '',
                  authButtonText: l10n.authLogout,
                  onAuthButtonPressed: () {
                    context.read<SessionCubit>().signOut();
                    showSnackBar(
                      context,
                      color: Colors.green,
                      text: l10n.logoutSuccessfully,
                    );
                  },
                  deleteButtonText: l10n.deleteAccount,
                  onDeleteButtonPressed: () {
                    showDialog<void>(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text(l10n.deleteAccount),
                        content: Text(
                          "${l10n.areYouSureYouWantToDelete} ${l10n.thisActionCannotBeUndone}",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(ctx),
                            child: Text(
                              l10n.cancel,
                              style: AppStyles.textStyle14(context),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(ctx);
                              context.read<SessionCubit>().deleteAccount();
                              showSnackBar(
                                context,
                                color: Colors.red,
                                text: l10n.accountDeleted,
                              );
                            },
                            child: Text(
                              l10n.delete,
                              style: AppStyles.textStyle14(
                                context,
                              ).copyWith(color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        }
        return ProfileListTile(
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
