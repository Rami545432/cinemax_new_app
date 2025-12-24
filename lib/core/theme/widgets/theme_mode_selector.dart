// lib/core/theme/widgets/theme_mode_selector.dart

import 'package:cinemax_app_new/core/theme/widgets/animated_theme_switcher.dart';
import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/theme_cubit.dart';
import '../cubit/theme_state.dart';

class ThemeModeSelector extends StatelessWidget {
  const ThemeModeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final style16 = AppStyles.textStyle16(context);
    final l10n = AppLocalizations.of(context);
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(l10n.theme, style: style16),

            // Three buttons in a row
            Row(
              children: [
                // Light button
                Expanded(
                  child: _ThemeModeButton(
                    label: l10n.light,
                    icon: Icons.light_mode,
                    isSelected: state.themeMode == ThemeMode.light,
                    onTap: () {
                      context.read<ThemeCubit>().setThemeMode(ThemeMode.light);
                    },
                  ),
                ),
                const SizedBox(width: 12),

                // Dark button
                Expanded(
                  child: _ThemeModeButton(
                    label: l10n.dark,
                    icon: Icons.dark_mode,
                    isSelected: state.themeMode == ThemeMode.dark,
                    onTap: () {
                      context.read<ThemeCubit>().setThemeMode(ThemeMode.dark);
                    },
                  ),
                ),
                const SizedBox(width: 12),

                // System button
                Expanded(
                  child: _ThemeModeButton(
                    label: l10n.system,
                    icon: Icons.settings_suggest,
                    isSelected: state.themeMode == ThemeMode.system,
                    onTap: () {
                      context.read<ThemeCubit>().setThemeMode(ThemeMode.system);
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

// Private widget for each button
class _ThemeModeButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _ThemeModeButton({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final style14 = AppStyles.textStyle14(context);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        // Animates when isSelected changes
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          // Selected = primary color, unselected = surface
          color: isSelected
              ? Theme.of(context).colorScheme.primaryContainer
              : Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? Theme.of(context).colorScheme.primaryContainer
                : Theme.of(context).colorScheme.surface,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: isSelected
                  ? Theme.of(context).colorScheme.onPrimaryContainer
                  : Theme.of(context).colorScheme.onSurface,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: style14.copyWith(
                color: isSelected
                    ? Theme.of(context).colorScheme.onPrimaryContainer
                    : Theme.of(context).colorScheme.onSurface,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
