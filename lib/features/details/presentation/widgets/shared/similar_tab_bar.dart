import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movify/core/di/service_locator.dart';
import 'package:movify/core/domain/use_cases/no_params.dart';
import 'package:movify/core/pagination/presentation/bloc/category_pagination_event.dart';
import 'package:movify/core/pagination/presentation/bloc/category_pagination_state.dart';
import 'package:movify/core/pagination/widgets/paginated_grid_view.dart';
import 'package:movify/features/details/domain/enums/similar_category.dart';
import 'package:movify/features/details/domain/use_cases/movies/fetch_similar_movies_use_case.dart';
import 'package:movify/features/details/domain/use_cases/tv/fetch_similar_series_use_case.dart';
import 'package:movify/features/details/presentation/blocs/similar_bloc.dart';
import 'package:movify/features/home/presentation/widgets/main_vertical_card.dart';
import 'package:movify/shared/presentation/models/card_display_model.dart';

class SimilarTabBarView extends StatelessWidget {
  const SimilarTabBarView({
    super.key,
    required this.category,
    required this.contentId,
  });
  final SimilarCategory category;
  final int contentId;

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => SimilarBloc(
      getIt.get<FetchSimilarMoviesUseCase>(),
      getIt.get<FetchSimilarSeriesUseCase>(),
      contentId,
    )..add(LoadCategoryEvent(category)),
    child:
        BlocBuilder<
          SimilarBloc,
          CategoryPaginationState<SimilarCategory, CardDisplayModel, NoParams>
        >(
          builder: (context, state) {
            if (state
                is CategoryPaginationLoaded<
                  SimilarCategory,
                  CardDisplayModel,
                  NoParams
                >) {
              return PaginatedGridView<CardDisplayModel>(
                info: state.getPaginationInfo(category),
                itemBuilder: (context, item) => MainVerticalCard(
                  category: 'similar-${category.name}-$contentId',
                  cardData: item,
                  imageSize: .w92,
                  enableHero: false,
                ),
                onScrollEnd: () => context.read<SimilarBloc>().add(
                  LoadNextPageEvent(category),
                ),
                onRetry: () => context.read<SimilarBloc>().add(
                  LoadCategoryEvent(category),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
  );
}
