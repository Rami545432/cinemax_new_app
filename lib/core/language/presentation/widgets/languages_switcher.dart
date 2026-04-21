import 'dart:ui' as ui;

import 'package:cinemax_app_new/core/language/presentation/cubits/language_cubit.dart';
import 'package:cinemax_app_new/core/language/presentation/widgets/language_list_tile.dart';
import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LanguagesSwitcher extends StatelessWidget {
  const LanguagesSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final languageState = context.watch<LanguageCubit>().state;
    final currentLanguageCode = languageState.locale.languageCode;
    final isSystemDefault = languageState.isSystemDefault;
    final l10n = AppLocalizations.of(context)!;
    final cubit = context.read<LanguageCubit>();
    final systemLanguageCode =
        ui.PlatformDispatcher.instance.locale.languageCode;

    return DraggableScrollableSheet(
      expand: false,
      snap: true,
      initialChildSize: 0.55,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) => Column(
        children: [
          // Drag handle
          Container(
            margin: const EdgeInsets.only(top: 12, bottom: 8),
            height: 4,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.grey.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // Title
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: Text(
              l10n.language,
              style: AppStyles.textStyle20(
                context,
              ).copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: Theme.of(context).dividerColor.withValues(alpha: 0.5),
          ),
          // List
          Expanded(
            child: ListView(
              controller: scrollController,
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              children: [
                LanguageListTile(
                  title:
                      "${l10n.system} \n(${cubit.getLanguageName(systemLanguageCode)})",
                  isSelected: isSystemDefault,
                  icon: Icons.phonelink_setup_rounded,
                  onTap: () {
                    cubit.changeLanguage('', isSystemDefault: true);
                    Future.delayed(const Duration(milliseconds: 250), () {
                      if (context.mounted) {
                        context.pop();
                      }
                    });
                  },
                ),
                ...AppLocalizations.supportedLocales.map((lang) {
                  final isLangSelected =
                      !isSystemDefault &&
                      lang.languageCode == currentLanguageCode;
                  return LanguageListTile(
                    title: cubit.getLanguageName(lang.languageCode),
                    isSelected: isLangSelected,
                    icon: Icons.language_rounded,
                    onTap: () {
                      cubit.changeLanguage(lang.languageCode);
                      Future.delayed(const Duration(milliseconds: 250), () {
                        if (context.mounted) {
                          context.pop();
                        }
                      });
                    },
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
