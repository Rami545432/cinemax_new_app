import 'package:cinemax_app_new/core/utils/app_colors.dart';
import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/features/discover/data/models/genre_filter.dart';
import 'package:cinemax_app_new/features/discover/presentation/cubit/genre_content_cubit.dart';
import 'package:cinemax_app_new/features/discover/presentation/widget/filter_button.dart';
import 'package:cinemax_app_new/features/discover/presentation/widget/rating_filter.dart';
import 'package:cinemax_app_new/features/discover/presentation/widget/sort_by_filter.dart';
import 'package:cinemax_app_new/features/discover/presentation/widget/year_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FilterSheet extends HookWidget {
  const FilterSheet({
    super.key,
    required this.scrollController,
    required this.category,
  });

  final ScrollController scrollController;
  final GenreCategory category;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<GenreContentCubit>();

    // SORT OPTIONS (filtered based on category)
    final sortOptions = SortBy.values.where((s) {
      if (category == GenreCategory.movies) {
        return s != SortBy.firstAirDateAsc && s != SortBy.firstAirDateDesc;
      } else {
        return s != SortBy.releaseDateAsc &&
            s != SortBy.releaseDateDesc &&
            s != SortBy.revenueAsc &&
            s != SortBy.revenueDesc;
      }
    }).toList();
    final filters = cubit.getFilters(category);

    // TEMP STATES (local UI state only)
    final selectedSortBy = useState<SortBy?>(filters?.sortBy);
    final rating = useState<RangeValues>(
      RangeValues(
        (filters?.minRating ?? 0).toDouble(),
        (filters?.maxRating ?? 10).toDouble(),
      ),
    );
    final year = useState<RangeValues>(
      RangeValues(
        (filters?.minYear ?? 1878).toDouble(),
        (filters?.maxYear ?? DateTime.now().year).toDouble(),
      ),
    );

    void applyFilters() {
      final minYear = year.value.start.toInt();
      final maxYear = year.value.end.toInt();
      cubit.updateFilters(
        contentType: category,
        filters: GenreFilterParams(
          sortBy: selectedSortBy.value,
          minRating: rating.value.start,
          maxRating: rating.value.end,
          minYear: minYear,
          maxYear: maxYear,
          genreId: filters?.genreId,
        ),
      );

      Navigator.pop(context);
    }

    void clearFilters() {
      selectedSortBy.value = null;
      rating.value = RangeValues(0, 10);
      year.value = RangeValues(1878, DateTime.now().year.toDouble());
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text('Filter', style: AppStyles.textStyle24(context)),
        ),
        body: ListView(
          controller: scrollController,
          children: [
            SortByFilter(
              sortOptions: sortOptions,
              selectedSortBy: selectedSortBy,
            ),

            SizedBox(height: 20),
            YearFilter(year: year),

            SizedBox(height: 20),
            RatingFilter(rating: rating),

            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilterButton(
                  onPressed: applyFilters,
                  icon: Icons.check,
                  label: 'Apply Filters',
                  backgroundColor: AppPrimaryColors.blueAccent,
                ),
                FilterButton(
                  onPressed: clearFilters,
                  icon: Icons.delete,
                  label: 'Clear Filters',
                  backgroundColor: Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
