import 'package:flutter/material.dart';
import 'package:movify/core/utils/app_colors.dart';
import 'package:movify/features/discover/presentation/widget/section_title.dart';

class RangeColumns extends StatelessWidget {
  const RangeColumns({
    super.key,
    required this.values,
    required this.onChanged,
    required this.min,
    required this.max,
    required this.divisions,
    required this.label,
    required this.trailing,
  });
  final RangeValues values;
  final void Function(RangeValues) onChanged;
  final double min;
  final double max;
  final int divisions;
  final String label;
  final String? trailing;
  @override
  Widget build(BuildContext context) => Column(
    children: [
      SectionTitle(label, trailing: trailing),

      RangeSlider(
        values: values,
        min: min,
        max: max,
        divisions: divisions,
        onChanged: onChanged,
        activeColor: AppPrimaryColors.blueAccent,
      ),
      const SizedBox(height: 24),
    ],
  );
}
