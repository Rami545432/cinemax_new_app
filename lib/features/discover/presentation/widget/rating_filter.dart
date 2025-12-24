import 'package:cinemax_app_new/core/utils/sub_bar.dart';
import 'package:cinemax_app_new/features/discover/presentation/widget/custom_range_slider.dart';
import 'package:flutter/material.dart';

class RatingFilter extends StatelessWidget {
  const RatingFilter({super.key, required this.rating});

  final ValueNotifier<RangeValues> rating;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SubBar(
          title: 'Rating',
          data: '${rating.value.start.toInt()} - ${rating.value.end.toInt()}',
        ),

        CustomRangeSlider(
          start: 0,
          end: 10,
          values: rating.value,
          onChanged: (v) => rating.value = v,
        ),
      ],
    );
  }
}
