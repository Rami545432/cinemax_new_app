import 'package:cinemax_app_new/core/di/service_locator.dart';
import 'package:cinemax_app_new/core/utils/pagination/presentation/bloc/category_pagination_event.dart';
import 'package:cinemax_app_new/core/utils/pagination/presentation/bloc/category_pagination_state.dart';
import 'package:cinemax_app_new/core/utils/pagination/presentation/views/base_browse_view.dart';
import 'package:cinemax_app_new/features/discover/domain/entities/genre_filter.dart';
import 'package:cinemax_app_new/features/discover/domain/use_cases/fetch_movie_by_genre_use_case.dart';
import 'package:cinemax_app_new/features/discover/domain/use_cases/fetch_series_by_genre_use_case.dart';
import 'package:cinemax_app_new/features/discover/presentation/blocs/fetch_genre_bloc.dart';
import 'package:cinemax_app_new/features/discover/presentation/widget/genre_filter_sheet.dart';
import 'package:cinemax_app_new/features/home/presentation/widgets/main_list_card.dart';
import 'package:cinemax_app_new/features/home/presentation/widgets/main_vertical_card.dart';
import 'package:cinemax_app_new/shared/presentation/models/card_display_model.dart';
import 'package:flutter/material.dart';

class GenreView
    extends
        BaseBrowseView<
          FetchGenreBloc,
          GenreCategory,
          CardDisplayModel,
          GenreFilterParams
        > {
  final int genreId;
  final String genreName;
  final GenreCategory selectedCategory;

  const GenreView({
    super.key,
    required this.genreId,
    required this.genreName,
    required this.selectedCategory,
  });

  @override
  String get screenTitle => genreName;

  @override
  List<GenreCategory> get categories => GenreCategory.values;

  @override
  GenreCategory get category => selectedCategory;

  @override
  FetchGenreBloc createBloc(BuildContext context) => FetchGenreBloc(
    fetchMoviesByGenreUseCase: getIt<FetchMoviesByGenreUseCase>(),
    fetchSeriesByGenreUseCase: getIt<FetchSeriesByGenreUseCase>(),
    genreId: genreId,
  );

  @override
  Widget buildListItem(BuildContext context, CardDisplayModel item) =>
      MainListCard(cardData: item);
  @override
  Widget buildGridItem(BuildContext context, CardDisplayModel item) =>
      MainVerticalCard(cardData: item);

  // ✅ selectedCategory arrives directly — no ancestor lookup
  @override
  List<Widget> buildActions(
    BuildContext context,
    FetchGenreBloc bloc,
    GenreCategory selectedCategory,
  ) => [
    IconButton(
      icon: const Icon(Icons.tune_rounded),
      onPressed: () => _openFilterSheet(context, bloc, selectedCategory),
    ),
  ];

  Future<void> _openFilterSheet(
    BuildContext context,
    FetchGenreBloc bloc,
    GenreCategory selectedCategory,
  ) async {
    final state = bloc.state;
    if (state
        is! CategoryPaginationLoaded<
          GenreCategory,
          CardDisplayModel,
          GenreFilterParams
        >) {
      return;
    }

    final currentParams =
        state.getPaginationInfo(selectedCategory).params ??
        const GenreFilterParams();

    final newParams = await GenreFilterSheet.show(
      context,
      currentParams: currentParams,
    );

    // User cancelled — do nothing
    if (newParams == null) {
      return;
    }

    // Fires UpdateParamsEvent — restartable() handles in-flight cancel
    bloc.add(UpdateParamsEvent(selectedCategory, newParams));
  }
}
