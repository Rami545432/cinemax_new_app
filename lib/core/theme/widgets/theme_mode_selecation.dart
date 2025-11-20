import 'package:cinemax_app_new/core/theme/cubit/theme_cubit.dart';
import 'package:cinemax_app_new/core/theme/cubit/theme_state.dart';
import 'package:cinemax_app_new/core/theme/widgets/theme_mode_selector.dart';
import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeModeSelectaion extends StatelessWidget {
  const ThemeModeSelectaion({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final style16 = AppStyles.textStyle16(context);
    final style14 = AppStyles.textStyle14(context);
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return DraggableScrollableSheet(
          snap: true,
          expand: false,
          snapSizes: const [0.25, 0.55, 0.95],
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    const ThemeModeSelector(),
                    Divider(thickness: 1),
                    Text(l10n.dark, style: style16),
                    CheckboxListTile(
                      value: state.colorScheme == AppColorScheme.veryDarkBlue,
                      onChanged: (value) {
                        context.read<ThemeCubit>().setColorScheme(
                          AppColorScheme.veryDarkBlue,
                        );
                      },
                      checkboxShape: CircleBorder(),
                      controlAffinity: ListTileControlAffinity.trailing,
                      activeColor: Colors.lightBlueAccent,
                      checkColor: Colors.white,
                      title: Text('Dim', style: style14),
                    ),
                    CheckboxListTile(
                      value: state.colorScheme == AppColorScheme.black,
                      onChanged: (value) {
                        context.read<ThemeCubit>().setColorScheme(
                          AppColorScheme.black,
                        );
                      },
                      title: Text('Lights Out', style: style14),
                      activeColor: Colors.lightBlueAccent,
                      checkColor: Colors.white,
                      checkboxShape: CircleBorder(),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
