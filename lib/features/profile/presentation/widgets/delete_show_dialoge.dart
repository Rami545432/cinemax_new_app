import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movify/core/utils/app_colors.dart';
import 'package:movify/core/utils/app_styles.dart';
import 'package:movify/features/auth/presentation/cubits/session_cubit.dart';
import 'package:movify/l10n/app_localizations.dart';
import 'package:movify/shared/presentation/utils/show_snack_bar.dart';
import 'package:movify/shared/presentation/widgets/size_config.dart';

class DeleteShowDialoge extends StatelessWidget {
  const DeleteShowDialoge({super.key});

  @override
  Widget build(BuildContext context) {
    final sessionCubit = context.read<SessionCubit>();
    final l10n = AppLocalizations.of(context)!;
    final width = MediaQuery.widthOf(context);
    final isMobile = width < SizeConfig.tablet;

    return AlertDialog(
      backgroundColor: Theme.of(context).dialogTheme.backgroundColor,
      actionsAlignment: MainAxisAlignment.center,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.delete_forever_outlined,
            size: isMobile ? 32 : 48,
            color: AppPrimaryColors.blueAccent,
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              l10n.areYouSureYouWantToDelete,
              style: AppStyles.textStyle20(context),
            ),
          ),
        ],
      ),
      content: Text(
        l10n.thisActionCannotBeUndone,
        style: AppStyles.textStyle16(context),
        textAlign: .center,
      ),
      actions: [
        OutlinedButton(
          onPressed: () => Navigator.pop(context),
          child: Text(l10n.cancel, style: AppStyles.textStyle16(context)),
        ),
        OutlinedButton(
          onPressed: () {
            Navigator.pop(context);
            sessionCubit.deleteAccount();
            showSnackBar(context, color: Colors.red, text: l10n.accountDeleted);
          },
          child: Text(
            l10n.delete,
            style: AppStyles.textStyle16(context).copyWith(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
