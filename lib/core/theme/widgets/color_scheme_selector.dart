// lib/core/theme/widgets/color_scheme_selector.dart

import 'package:cinemax_app_new/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/theme_cubit.dart';
import '../cubit/theme_state.dart';

class ColorSchemeSelector extends StatelessWidget {
  const ColorSchemeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Choose Color Scheme',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),

            // Horizontal scrollable list of colors
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: AppColorScheme.values.length,
                itemBuilder: (context, index) {
                  final scheme = AppColorScheme.values[index];
                  final isSelected = state.colorScheme == scheme;

                  return GestureDetector(
                    onTap: () {
                      // Change color scheme
                      context.read<ThemeCubit>().setColorScheme(scheme);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 60,
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        color: _getColorForScheme(scheme),
                        borderRadius: BorderRadius.circular(12),

                        // White border when selected
                        border: isSelected
                            ? Border.all(color: Colors.white, width: 3)
                            : null,

                        // Glow effect when selected
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: _getColorForScheme(
                                    scheme,
                                  ).withValues(alpha: 0.5),
                                  blurRadius: 8,
                                  spreadRadius: 2,
                                ),
                              ]
                            : null,
                      ),

                      // Checkmark when selected
                      child: isSelected
                          ? const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 30,
                            )
                          : null,
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Color _getColorForScheme(AppColorScheme scheme) {
    switch (scheme) {
      case AppColorScheme.blue:
        return Colors.blue;
      case AppColorScheme.green:
        return Colors.green;
      case AppColorScheme.purple:
        return Colors.deepPurple;
      case AppColorScheme.orange:
        return Colors.deepOrange;
      case AppColorScheme.red:
        return Colors.red;
      case AppColorScheme.veryDarkBlue:
        return AppPrimaryColors.dark;
      case AppColorScheme.softBlue:
        return AppPrimaryColors.soft;
      case AppColorScheme.blueAccent:
        return Colors.blueAccent;
      case AppColorScheme.black:
        return Colors.black;
    }
  }
}
