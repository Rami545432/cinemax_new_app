import 'package:cinemax_app_new/core/types/home_view_types.dart';
import 'package:cinemax_app_new/core/utils/app_colors.dart';
import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/core/utils/get_it.dart';
import 'package:cinemax_app_new/core/utils/size_config.dart';
import 'package:cinemax_app_new/core/utils/skeletionzed_loading_cards/vertical_film_card_loading.dart';
import 'package:cinemax_app_new/core/utils/use_case/use_case.dart';
import 'package:cinemax_app_new/features/Bot/presentation/views/chat_bot_view.dart';
import 'package:cinemax_app_new/features/Bot/presentation/views/chat_bot_view_body.dart';
import 'package:cinemax_app_new/features/home/data/data_soureces/remote_home_data_source.dart';
import 'package:cinemax_app_new/features/home/data/models/discover_model_list.dart';
import 'package:cinemax_app_new/features/home/presentation/cubit/home_view_cubit.dart';
import 'package:cinemax_app_new/features/home/presentation/cubit/movie_category.dart';
import 'package:cinemax_app_new/features/home/presentation/views_models/views/json_test.dart';
import 'package:cinemax_app_new/features/home/presentation/views_models/widgets/card_loading_list_view.dart';
import 'package:cinemax_app_new/features/home/presentation/views_models/widgets/horizontal_film_card_widgets/horizontal_expandable_page_view.dart';
import 'package:cinemax_app_new/features/home/presentation/views_models/widgets/main_vertical_card.dart';
import 'package:cinemax_app_new/features/search/presentaion/view_models/widgets/search_bar_button.dart';
import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewCubit, HomeViewState>(
      builder: (context, state) {
        final l10n = AppLocalizations.of(context);

        if (state is HomeViewLoaded) {
          return RefreshIndicator(
            color: AppPrimaryColors.blueAccent,
            onRefresh: () async =>
                await context.read<HomeViewCubit>().loadAllCategories(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChatBotView(),
                        ),
                      );
                    },
                    child: Text(
                      'Discover',
                      style: AppStyles.textStyle16(context),
                    ),
                  ),
                  SearchBarButton(),
                  HorizontalExpandablePageView(
                    key: ValueKey(
                      state.getItems(MovieCategory.trending).length,
                    ),
                    data: state.getItems(MovieCategory.trending),
                  ),
                  HomePaginatedItem(
                    category: MovieCategory.popular,
                    title: l10n.popular,

                    itemBuilder: (item) =>
                        MainVerticalCard(cardModel: item, title: l10n.popular),
                  ),
                  HomePaginatedItem(
                    category: MovieCategory.upcoming,
                    title: l10n.upcoming,

                    itemBuilder: (item) =>
                        MainVerticalCard(cardModel: item, title: l10n.upcoming),
                  ),
                  HomePaginatedItem(
                    category: MovieCategory.nowPlaying,
                    title: l10n.nowPlaying,

                    itemBuilder: (item) => MainVerticalCard(
                      cardModel: item,
                      title: l10n.nowPlaying,
                    ),
                  ),
                  HomePaginatedItem(
                    category: MovieCategory.topRated,
                    title: l10n.topRated,
                    itemBuilder: (item) =>
                        MainVerticalCard(cardModel: item, title: l10n.topRated),
                  ),
                ],
              ),
            ),
          );
        }

        return Center(child: Text('Unknown state'));
      },
    );
  }
}

class DiscoverWidget extends StatelessWidget {
  const DiscoverWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final data = getIt.get<RemoteHomeDataSourceImpl>().jsondecode;
    final width = MediaQuery.sizeOf(context).width;
    final l10n = AppLocalizations.of(context);
    return Skeletonizer(
      enabled: true,
      child: AspectRatio(
        aspectRatio: width > SizeConfig.mobile ? 3 : 1.45,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: 20,
          separatorBuilder: (_, _) => SizedBox(width: 50, height: 50),
          itemBuilder: (context, index) {
            return VerticalFilmCardLoading();
          },
        ),
      ),
    );
  }
}

class DiscoverBox extends StatelessWidget {
  const DiscoverBox({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: discoverModelList[0].onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppPrimaryColors.dark,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white),
        ),
        padding: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(discoverModelList[0].icon),
              Text(discoverModelList[0].title),
            ],
          ),
        ),
      ),
    );
  }
}
