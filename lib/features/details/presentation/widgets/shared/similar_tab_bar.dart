import 'package:cinemax_app_new/core/di/service_locator.dart';
import 'package:cinemax_app_new/core/network/api/services/tmdb/tmdb_image_size.dart';
import 'package:cinemax_app_new/core/types/similar_types.dart';
import 'package:cinemax_app_new/core/utils/app_colors.dart';
import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/core/utils/pagination/cubit/category_pagination_state.dart';
import 'package:cinemax_app_new/features/details/domain/enums/similar_category.dart';
import 'package:cinemax_app_new/features/details/domain/use_cases/fetch_similar_use_case.dart';
import 'package:cinemax_app_new/features/details/presentation/cubits/fetch_similar_cubit.dart';
import 'package:cinemax_app_new/features/home/presentation/views_models/widgets/main_vertical_card.dart';
import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:cinemax_app_new/models/base_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarTabBarView extends StatelessWidget {
  const SimilarTabBarView({
    super.key,
    required this.category,
    required this.contentId,
  });
  final SimilarCategory category;
  final int contentId;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocProvider(
      create: (context) =>
          getIt.get<FetchSimilarCubit>()
            ..loadSimilarContent(category: category, contentId: contentId),
      child:
          BlocBuilder<
            FetchSimilarCubit,
            CategoryPaginationState<SimilarCategory, BaseCardModel, void>
          >(
            builder: (context, state) {
              if (state is SimilarStateLoaded) {
                final items = state.getItems(category);
                final isLoading = state.isLoading(category);
                final isInitialLoad = state.isInitialLoad(category);
                final canLoadMore = state.canLoadMore(category);
                final error = state.getError(category);
                if (isInitialLoad && isLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppPrimaryColors.blueAccent,
                    ),
                  );
                }
                if (error != null) {
                  return Center(child: Text(error));
                }
                if (items.isEmpty && !isLoading) {
                  return Center(
                    child: Text(
                      l10n.noItemsFound,
                      style: AppStyles.textStyle16(context),
                    ),
                  );
                }
                return SimilarGridView(
                  data: items,
                  category: category,
                  params: SimilarParams(id: contentId),
                  itemBuilder: (item) => MainVerticalCard(
                    posterImage: tmdbImageSize(
                      TmdbImageSize.w300,
                      item.cardImage,
                    ),
                    title: item.cardTitle,
                    rating: item.cardRating ?? 0,
                    id: item.cardId,
                    type: item.type,
                    category: '',
                  ),
                  isLoading: isLoading,
                  canLoadMore: canLoadMore,
                );
              }
              return const SizedBox.shrink();
            },
          ),
    );
  }
}
