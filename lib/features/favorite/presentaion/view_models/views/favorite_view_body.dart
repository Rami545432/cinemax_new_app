import 'package:cinemax_app_new/core/utils/animations/generic_animated_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/enums/content_type.dart';
import '../../../../home/presentaion/views_models/widgets/card_image_and_rating.dart';
import '../../../../home/presentaion/views_models/widgets/details_widgets/custom_tab_bar.dart';
import '../../../data/models/favorite_model.dart';
import '../../../presentation/cubit/favorite_cubit.dart';

class FavoriteBody extends StatefulWidget {
  const FavoriteBody({super.key});

  @override
  State<FavoriteBody> createState() => _FavoriteBodyState();
}

late TabController tabController;

class _FavoriteBodyState extends State<FavoriteBody>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: ContentType.values.length,
      vsync: this,
    );

    BlocProvider.of<FavoriteCubit>(
      context,
    ).getFavoritesByType(ContentType.movies);

    tabController.addListener(() {
      if (tabController.indexIsChanging) return;
      final selectedType = ContentType.values[tabController.index];

      BlocProvider.of<FavoriteCubit>(context).getFavoritesByType(selectedType);
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: ContentType.values.length,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxScrolled) {
          return [
            SliverAppBar(title: const Text('Favorites'), pinned: true),
            CustomTabBar(
              tabs: ContentType.values.map((e) => e.tab).toList(),
              controller: tabController,
            ),
          ];
        },
        body: TabBarView(
          controller: tabController,
          children: [
            _buildFavoritesList(ContentType.movies),
            _buildFavoritesList(ContentType.series),
            _buildFavoritesList(ContentType.seasons),
            _buildFavoritesList(ContentType.episodes),
          ],
        ),
      ),
    );
  }

  Widget _buildFavoritesList(ContentType type) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        if (state is FavoriteError) {
          return Center(child: Text(state.message));
        }
        if (state is FavoritesLoaded) {
          if (state.favorites.isEmpty) {
            return Center(child: Text('No ${type.name} in favorites'));
          }
          return GenericAnimatedWidget<FavoriteModel>(
            widgetType: GenericAnimatedWidgetType.grid,

            items: state.favorites,
            itemBuilder: (item, onRemove) => CardImage(imageUrl: item.imageUrl),
            onItemRemoved: (item) =>
                context.read<FavoriteCubit>().removeFavorite(item.id, type),
          );
        }

        return const Center(child: Text('Loading...'));
      },
    );
  }
}
