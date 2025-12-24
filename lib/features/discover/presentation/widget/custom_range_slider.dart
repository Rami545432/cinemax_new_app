import 'package:cinemax_app_new/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomRangeSlider extends HookWidget {
  const CustomRangeSlider({
    super.key,
    required this.start,
    required this.end,
    required this.values,
    this.onChanged,
  });
  final double start;
  final double end;
  final void Function(RangeValues)? onChanged;
  final RangeValues values;

  @override
  Widget build(BuildContext context) {
    final startValue = useState(start);
    final endValue = useState(end);
    return Column(
      children: [
        RangeSlider(
          values: values,
          onChanged: (v) {
            startValue.value = v.start;
            endValue.value = v.end;
            onChanged?.call(v);
          },
          min: start,
          max: end,
          activeColor: AppPrimaryColors.blueAccent,
          divisions: (end - start).toInt(),
          labels: RangeLabels(
            '${startValue.value.toInt()}',
            '${endValue.value.toInt()}',
          ),
        ),
      ],
    );
  }
}
