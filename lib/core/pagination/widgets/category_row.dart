import 'package:flutter/material.dart';
import 'package:movify/core/pagination/presentation/bloc/new_pagination_info.dart';
import 'package:movify/core/utils/app_colors.dart';
import 'package:movify/core/utils/app_styles.dart';
import 'package:movify/l10n/app_localizations.dart';

/// A generic horizontal category row.
/// Reusable across Movies, Series, News, Products — anything.
///
/// Usage — MovieCategoryRow:
// ignore: unintended_html_in_doc_comment
/// CategoryRow<MovieEntity>(
///   title: category.label,
///   info: state.getPaginationInfo(category),
///   itemBuilder: (ctx, movie) => MovieCard(movie: movie),
///   onVisible: () => bloc.add(LoadCategoryEvent(category)),
///   onScrollEnd: () => bloc.add(LoadNextPageEvent(category)),
///   onRetry: () => bloc.add(LoadCategoryEvent(category)),
///   onSeeAll: () => Navigator.push(...),
/// )
class CategoryRow<T> extends StatefulWidget {
  final String title;
  final PaginationInfo<T, dynamic> info;

  /// Builds the ENTIRE content area — not just one item.
  /// Gives full control: list, banner, grid, carousel — anything.
  final Widget Function(BuildContext context, PaginationInfo<T, dynamic> info)
  contentBuilder;

  final VoidCallback onVisible;
  final VoidCallback? onSeeAll;
  final double visibilityThreshold;
  final bool showHeader;

  const CategoryRow({
    super.key,
    required this.title,
    required this.info,
    required this.contentBuilder,
    required this.onVisible,
    this.onSeeAll,
    this.visibilityThreshold = 0.1,
    this.showHeader = true,
  });

  @override
  State<CategoryRow<T>> createState() => _CategoryRowState<T>();
}

class _CategoryRowState<T> extends State<CategoryRow<T>> {
  // bool _fetched = false;

  // void _onVisibilityChanged(VisibilityInfo info) {
  //   if (!_fetched && info.visibleFraction >= widget.visibilityThreshold) {
  //     _fetched = true;
  //     widget.onVisible();
  //   }
  // }

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      if (widget.showHeader) ...[
        _CategoryRowHeader(title: widget.title, onSeeAll: widget.onSeeAll),
      ],

      // ── Entire content area is now injected ─────────
      widget.contentBuilder(context, widget.info),
    ],
  );
}

// ── Header — extracted so it can be tested independently ─────────
class _CategoryRowHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onSeeAll;

  const _CategoryRowHeader({required this.title, this.onSeeAll});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(16, 20, 8, 12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        if (onSeeAll != null)
          TextButton(
            onPressed: onSeeAll,
            child: Text(
              AppLocalizations.of(context)!.seeAll,
              style: AppStyles.textStyle16(
                context,
              ).copyWith(color: AppPrimaryColors.blueAccent),
            ),
          ),
      ],
    ),
  );
}
