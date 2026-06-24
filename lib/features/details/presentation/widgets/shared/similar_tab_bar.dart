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
import 'package:movify/shared/presentation/widgets/premium_staggered_entrance.dart';

class SimilarTabBarView extends StatefulWidget {
  const SimilarTabBarView({
    super.key,
    required this.category,
    required this.contentId,
  });
  final SimilarCategory category;
  final int contentId;

  @override
  State<SimilarTabBarView> createState() => _SimilarTabBarViewState();
}

class _SimilarTabBarViewState extends State<SimilarTabBarView> {
  final Set<int> _animatedIds = {};
  int _staggerCounter = 0;

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => SimilarBloc(
      getIt.get<FetchSimilarMoviesUseCase>(),
      getIt.get<FetchSimilarSeriesUseCase>(),
      widget.contentId,
    )..add(LoadCategoryEvent(widget.category)),
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
                info: state.getPaginationInfo(widget.category),
                itemBuilder: (context, item) {
                  final Widget child = MainVerticalCard(
                    category:
                        'similar-${widget.category.name}-${widget.contentId}',
                    cardData: item,
                    imageSize: .w154,
                    enableHero: false,
                  );

                  return PremiumStaggeredEntrance(
                    index:
                        _staggerCounter++, // Automatically handles grid staggering
                    isAnimated: _animatedIds.contains(item.id),
                    markAsAnimated: () => _animatedIds.add(item.id),
                    child: child,
                  );
                },
                onScrollEnd: () => context.read<SimilarBloc>().add(
                  LoadNextPageEvent(widget.category),
                ),
                onRetry: () => context.read<SimilarBloc>().add(
                  LoadCategoryEvent(widget.category),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
  );
}
