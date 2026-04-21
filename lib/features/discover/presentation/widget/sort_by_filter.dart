import 'package:cinemax_app_new/core/utils/app_colors.dart';
import 'package:cinemax_app_new/features/discover/domain/enums/sort_by_enum.dart';
import 'package:cinemax_app_new/shared/presentation/widgets/sub_bar.dart';
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
  Widget build(BuildContext context) => Column(
    children: [
      const SubBar(title: 'Sort By'),
      const SizedBox(height: 10),
      Wrap(
        spacing: 8,
        runSpacing: 8,
        children: sortOptions
            .map(
              (sort) => ChoiceChip(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                selectedColor: AppPrimaryColors.blueAccent,
                label: Text(sort.name),
                selected: selectedSortBy.value == sort,
                onSelected: (_) => selectedSortBy.value = sort,
              ),
            )
            .toList(),
      ),
    ],
  );
}
