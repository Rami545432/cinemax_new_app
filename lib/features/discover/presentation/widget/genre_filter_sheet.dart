// features/genre/widgets/genre_filter_sheet.dart

import 'package:cinemax_app_new/core/utils/app_colors.dart';
import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/features/discover/domain/entities/genre_filter.dart';
import 'package:cinemax_app_new/features/discover/domain/enums/sort_by_enum.dart';
import 'package:cinemax_app_new/features/discover/presentation/widget/section_title.dart';
import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class GenreFilterSheet extends StatefulWidget {
  final GenreFilterParams currentParams;

  const GenreFilterSheet({super.key, required this.currentParams});

  static Future<GenreFilterParams?> show(
    BuildContext context, {
    required GenreFilterParams currentParams,
  }) => showModalBottomSheet<GenreFilterParams>(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) => GenreFilterSheet(currentParams: currentParams),
  );

  @override
  State<GenreFilterSheet> createState() => _GenreFilterSheetState();
}

class _GenreFilterSheetState extends State<GenreFilterSheet> {
  late SortBy? _sortBy;
  late RangeValues _yearRange;
  late RangeValues _ratingRange;
  late RangeValues _runtimeRange;

  final _currentYear = DateTime.now().year;

  @override
  void initState() {
    super.initState();
    // Pre-fill from current params
    _sortBy = widget.currentParams.sortBy;
    _yearRange = RangeValues(
      (widget.currentParams.minYear ?? 1990).toDouble(),
      (widget.currentParams.maxYear ?? _currentYear).toDouble(),
    );
    _ratingRange = RangeValues(
      widget.currentParams.minRating ?? 0,
      widget.currentParams.maxRating ?? 10,
    );
    _runtimeRange = RangeValues(
      (widget.currentParams.minRuntime ?? 0).toDouble(),
      (widget.currentParams.maxRuntime ?? 300).toDouble(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      maxChildSize: 0.95,
      minChildSize: 0.5,
      expand: false,
      builder: (context, scrollController) => Column(
        children: [
          // ── Handle ──────────────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          Expanded(
            child: ListView(
              controller: scrollController,
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              children: [
                // ── Sort by ────────────────────────────────
                SectionTitle(l10n.sortBy),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _relevantSortOptions
                      .map(
                        (sort) => ChoiceChip(
                          label: Text(sort.localizedName(context)),
                          selectedColor: Colors.blue,
                          selected: _sortBy == sort,
                          onSelected: (_) => setState(() => _sortBy = sort),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 24),

                // ── Year range ─────────────────────────────
                RangeColumns(
                  values: _yearRange,

                  onChanged: (v) => setState(() => _yearRange = v),
                  min: 1990,
                  max: _currentYear.toDouble(),
                  divisions: _currentYear - 1990,
                  label: 'Year',
                  trailing:
                      '${_yearRange.start.toInt()} — ${_yearRange.end.toInt()}',
                ),

                // ── Rating range ───────────────────────────
                RangeColumns(
                  values: _ratingRange,
                  onChanged: (v) => setState(() => _ratingRange = v),
                  min: 0,
                  max: 10,
                  divisions: 20,
                  label: 'Rating',
                  trailing:
                      '${_ratingRange.start.toStringAsFixed(1)} — ${_ratingRange.end.toStringAsFixed(1)}',
                ),

                // ── Runtime range ──────────────────────────
                RangeColumns(
                  values: _runtimeRange,
                  onChanged: (v) => setState(() => _runtimeRange = v),
                  min: 0,
                  max: 300,
                  divisions: 30,
                  label: 'Runtime (min)',
                  trailing:
                      '${_runtimeRange.start.toInt()} — ${_runtimeRange.end.toInt()}',
                ),

                // ── Actions ────────────────────────────────
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: _onReset,
                        child: Text(
                          l10n.clearFilters,
                          style: AppStyles.textStyle18(context),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: FilledButton(
                        onPressed: _onApply,
                        child: Text(
                          l10n.applyFilters,
                          style: AppStyles.textStyle18(context),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Only show sort options relevant to both movies and TV
  List<SortBy> get _relevantSortOptions => [
    SortBy.popularityDesc,
    SortBy.popularityAsc,
    SortBy.ratingDesc,
    SortBy.ratingAsc,
    SortBy.releaseDateDesc,
    SortBy.releaseDateAsc,
    SortBy.voteCountDesc,
    SortBy.voteCountAsc,
  ];

  void _onReset() {
    Navigator.pop(context, const GenreFilterParams());
  }

  void _onApply() {
    Navigator.pop(
      context,
      GenreFilterParams(
        sortBy: _sortBy,
        minYear: _yearRange.start.toInt() == 1990
            ? null
            : _yearRange.start.toInt(),
        maxYear: _yearRange.end.toInt() == _currentYear
            ? null
            : _yearRange.end.toInt(),
        minRating: _ratingRange.start == 0 ? null : _ratingRange.start,
        maxRating: _ratingRange.end == 10 ? null : _ratingRange.end,
        minRuntime: _runtimeRange.start == 0
            ? null
            : _runtimeRange.start.toInt(),
        maxRuntime: _runtimeRange.end == 300 ? null : _runtimeRange.end.toInt(),
      ),
    );
  }
}

// ── Section title helper ──────────────────────────────────────────

// class CustomRangeSlider extends StatelessWidget {
//   const CustomRangeSlider({
//     super.key,
//     required this.values,
//     required this.onChanged,
//     required this.min,
//     required this.max,
//     required this.divisions,
//   });
//   final RangeValues values;
//   final void Function(RangeValues) onChanged;
//   final double min;
//   final double max;
//   final int divisions;

//   @override
//   Widget build(BuildContext context) => RangeSlider(
//     values: values,
//     min: min,
//     max: max,
//     divisions: divisions,
//     onChanged: onChanged,
//     activeColor: AppPrimaryColors.blueAccent,
//   );
// }

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
