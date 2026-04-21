import 'package:cinemax_app_new/features/discover/presentation/widget/custom_range_slider.dart';
import 'package:cinemax_app_new/shared/presentation/widgets/sub_bar.dart';
import 'package:flutter/material.dart';

class YearFilter extends StatelessWidget {
  const YearFilter({super.key, required this.year});

  final ValueNotifier<RangeValues> year;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      SubBar(
        title: 'Year',
        data: '${year.value.start.toInt()} - ${year.value.end.toInt()}',
      ),

      CustomRangeSlider(
        start: 1878,
        end: DateTime.now().year.toDouble(),
        values: year.value,
        onChanged: (v) => year.value = v,
      ),
    ],
  );
}
