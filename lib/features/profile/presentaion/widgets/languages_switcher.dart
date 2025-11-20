import 'package:cinemax_app_new/core/utils/app_colors.dart';
import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:cinemax_app_new/l10n/local_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LanguagesSwitcher extends StatelessWidget {
  const LanguagesSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLanguageCode = context
        .read<LocaleCubit>()
        .state
        .locale
        .languageCode;

    return DraggableScrollableSheet(
      expand: false,
      snap: true,
      snapSizes: const [0.25, 0.55, 0.95],
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...AppLocalizations.supportedLocales.map((lang) {
                    return TextButton(
                      onPressed: () {
                        context.read<LocaleCubit>().changeLocale(
                          lang.languageCode,
                        );

                        Future.delayed(const Duration(milliseconds: 300), () {
                          if (context.mounted) {
                            context.pop();
                          }
                        });
                      },
                      child: Text(
                        context.read<LocaleCubit>().getLanguageName(
                          lang.languageCode,
                        ),
                        style: AppStyles.textStyle16(context).copyWith(
                          color: lang.languageCode == currentLanguageCode
                              ? AppPrimaryColors.blueAccent
                              : Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
