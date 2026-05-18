import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movify/core/di/service_locator.dart';
import 'package:movify/core/domain/use_cases/no_params.dart';
import 'package:movify/core/pagination/presentation/bloc/category_pagination_event.dart';
import 'package:movify/core/pagination/presentation/bloc/category_pagination_state.dart';
import 'package:movify/core/pagination/widgets/paginated_grid_view.dart';
import 'package:movify/features/details/domain/enums/recomended_category.dart';
import 'package:movify/features/details/domain/use_cases/movies/fetch_movies_recommendations_use_case.dart';
import 'package:movify/features/details/domain/use_cases/tv/fetch_series_recommendations_use_case.dart';
import 'package:movify/features/details/presentation/blocs/recomended_bloc.dart';
import 'package:movify/features/home/presentation/widgets/main_vertical_card.dart';
import 'package:movify/shared/presentation/models/card_display_model.dart';

class RecomendedTabBarView extends StatelessWidget {
  const RecomendedTabBarView({
    super.key,
    required this.category,
    required this.contentId,
  });
  final RecomendedCategory category;
  final int contentId;

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => RecomendedBloc(
      getIt.get<FetchMoviesRecommendationsUseCase>(),
      getIt.get<FetchSeriesRecommendationsUseCase>(),
      contentId,
    )..add(LoadCategoryEvent(category)),
    child:
        BlocBuilder<
          RecomendedBloc,
          CategoryPaginationState<
            RecomendedCategory,
            CardDisplayModel,
            NoParams
          >
        >(
          builder: (context, state) {
            if (state
                is CategoryPaginationLoaded<
                  RecomendedCategory,
                  CardDisplayModel,
                  NoParams
                >) {
              state.getPaginationInfo(category);
              return PaginatedGridView<CardDisplayModel>(
                info: state.getPaginationInfo(category),
                itemBuilder: (context, item) =>
                    MainVerticalCard(cardData: item),
                onScrollEnd: () => context.read<RecomendedBloc>().add(
                  LoadNextPageEvent(category),
                ),
                onRetry: () => context.read<RecomendedBloc>().add(
                  LoadCategoryEvent(category),
                ),
              );
            }
            return Center(
              child: Text(
                "$contentId",
                style: const TextStyle(color: Colors.white),
              ),
            );
          },
        ),
  );
}
