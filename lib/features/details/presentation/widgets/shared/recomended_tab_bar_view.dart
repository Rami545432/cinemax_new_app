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
import 'package:movify/shared/presentation/widgets/premium_staggered_entrance.dart';

class RecomendedTabBarView extends StatefulWidget {
  const RecomendedTabBarView({
    super.key,
    required this.category,
    required this.contentId,
  });
  final RecomendedCategory category;
  final int contentId;

  @override
  State<RecomendedTabBarView> createState() => _RecomendedTabBarViewState();
}

class _RecomendedTabBarViewState extends State<RecomendedTabBarView> {
  // Use a Set of IDs to track which cards have been animated
  final Set<int> _animatedIds = {};

  // A local counter to stagger the items as they are built, since we don't have an index
  int _staggerCounter = 0;

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => RecomendedBloc(
      getIt.get<FetchMoviesRecommendationsUseCase>(),
      getIt.get<FetchSeriesRecommendationsUseCase>(),
      widget.contentId,
    )..add(LoadCategoryEvent(widget.category)),
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
              state.getPaginationInfo(widget.category);
              return PaginatedGridView<CardDisplayModel>(
                info: state.getPaginationInfo(widget.category),
                itemBuilder: (context, item) {
                  final Widget child = MainVerticalCard(
                    category: '${widget.category.name}-${widget.contentId}',
                    cardData: item,
                    imageSize: .w154,
                    enableHero: false,
                  );

                  return PremiumStaggeredEntrance(
                    index: _staggerCounter++,
                    isAnimated: _animatedIds.contains(item.id),
                    markAsAnimated: () => _animatedIds.add(item.id),
                    child: child,
                  );
                },
                onScrollEnd: () => context.read<RecomendedBloc>().add(
                  LoadNextPageEvent(widget.category),
                ),
                onRetry: () => context.read<RecomendedBloc>().add(
                  LoadCategoryEvent(widget.category),
                ),
              );
            }
            return Center(
              child: Text(
                "${widget.contentId}",
                style: const TextStyle(color: Colors.white),
              ),
            );
          },
        ),
  );
}
