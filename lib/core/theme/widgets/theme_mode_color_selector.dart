import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movify/core/theme/cubit/theme_cubit.dart';
import 'package:movify/core/theme/cubit/theme_state.dart';
import 'package:movify/core/theme/widgets/theme_mode_selector.dart';
import 'package:movify/core/utils/app_colors.dart';
import 'package:movify/core/utils/app_styles.dart';
import 'package:movify/l10n/app_localizations.dart';

class ThemeModeColorSelector extends StatelessWidget {
  const ThemeModeColorSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final style18 = AppStyles.textStyle18(context);
    final style16 = AppStyles.textStyle16(context);
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) => DraggableScrollableSheet(
        snap: true,
        expand: false,
        snapSizes: const [0.25, 0.55, 0.95],
        builder: (context, scrollController) => SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                const ThemeModeSelector(),
                const Divider(thickness: 1),
                Text(l10n!.dark, style: style18),
                CheckboxListTile(
                  value: state.accentColor == AppPrimaryColors.dark,
                  onChanged: (value) {
                    context.read<ThemeCubit>().setAccentColor(
                      AppPrimaryColors.dark,
                    );
                  },
                  checkboxShape: const CircleBorder(),
                  controlAffinity: ListTileControlAffinity.trailing,
                  activeColor: Colors.lightBlueAccent,
                  checkColor: Colors.white,
                  title: Text('Dim', style: style16),
                ),
                CheckboxListTile(
                  value: state.accentColor == Colors.black,
                  onChanged: (value) {
                    context.read<ThemeCubit>().setAccentColor(Colors.black);
                  },
                  title: Text('Lights Out', style: style16),
                  activeColor: Colors.lightBlueAccent,
                  checkColor: Colors.white,
                  checkboxShape: const CircleBorder(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
