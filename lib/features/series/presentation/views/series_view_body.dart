import 'package:cinemax_app_new/core/types/series_view_types.dart';
import 'package:cinemax_app_new/core/utils/app_colors.dart';
import 'package:cinemax_app_new/features/home/presentation/views_models/widgets/horizontal_film_card_widgets/horizontal_expandable_page_view.dart';
import 'package:cinemax_app_new/features/home/presentation/views_models/widgets/main_vertical_card.dart';
import 'package:cinemax_app_new/features/search/presentaion/view_models/widgets/search_bar_button.dart';
import 'package:cinemax_app_new/features/series/presentation/cubit/seires_category.dart';
import 'package:cinemax_app_new/features/series/presentation/cubit/series_view_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeriesViewBody extends StatelessWidget {
  const SeriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeriesViewCubit, SeriesViewState>(
      builder: (context, state) {
        if (state is SeriesViewLoaded) {
          return RefreshIndicator(
            color: AppPrimaryColors.blueAccent,
            onRefresh: () async =>
                await context.read<SeriesViewCubit>().loadAllCategories(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SearchBarButton(),
                  HorizontalExpandablePageView(
                    key: ValueKey(
                      state.getItems(SeriesCategory.trending).length,
                    ),
                    data: state.getItems(SeriesCategory.trending),
                  ),
                  SeriesPaginatedItem(
                    category: SeriesCategory.popular,
                    title: SeriesCategory.popular.name,

                    itemBuilder: (item) => MainVerticalCard(
                      cardModel: item,
                      title: SeriesCategory.popular.name,
                    ),
                  ),
                  SeriesPaginatedItem(
                    category: SeriesCategory.airingToday,
                    title: SeriesCategory.airingToday.name,

                    itemBuilder: (item) => MainVerticalCard(
                      cardModel: item,
                      title: SeriesCategory.airingToday.name,
                    ),
                  ),

                  SeriesPaginatedItem(
                    category: SeriesCategory.topRated,
                    title: SeriesCategory.topRated.name,
                    itemBuilder: (item) => MainVerticalCard(
                      cardModel: item,
                      title: SeriesCategory.topRated.name,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
