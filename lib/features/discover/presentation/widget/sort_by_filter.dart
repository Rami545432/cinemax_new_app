import 'package:cinemax_app_new/core/utils/app_colors.dart';
import 'package:cinemax_app_new/core/utils/sub_bar.dart';
import 'package:cinemax_app_new/features/discover/data/models/genre_filter.dart';
import 'package:flutter/material.dart';

class SortByFilter extends StatelessWidget {
  const SortByFilter({
    super.key,
    required this.sortOptions,
    required this.selectedSortBy,
  });

  final List<SortBy> sortOptions;
  final ValueNotifier<SortBy?> selectedSortBy;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SubBar(title: 'Sort By'),
        SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: sortOptions.map((sort) {
            return ChoiceChip(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              selectedColor: AppPrimaryColors.blueAccent,
              label: Text(sort.uiLabel),
              selected: selectedSortBy.value == sort,
              onSelected: (_) => selectedSortBy.value = sort,
            );
          }).toList(),
        ),
      ],
    );
  }
}
