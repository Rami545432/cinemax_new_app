import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../constant.dart';
import '../../../../../core/utils/enums/content_type.dart';
import '../../../../home/presentaion/views_models/widgets/details_widgets/custom_tab_bar.dart';
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
      log(selectedType.name);

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
    final data = BlocProvider.of<FavoriteCubit>(
      context,
    ).getFavoritesByType(ContentType.movies);
    log(data.toString());
    return DefaultTabController(
      length: ContentType.values.length,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxScrolled) {
          return [
            SliverAppBar(
              title: const Text('WishList'),
              pinned: true,
              floating: true,
            ),
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
          return ListView.builder(
            itemCount: state.favorites.length,
            itemBuilder: (context, index) {
              return CachedNetworkImage(
                imageUrl: '$baseImageUrl${state.favorites[index].imageUrl}',
                width: 100,
                height: 150,
                fit: BoxFit.cover,
              );
            },
          );
        }

        return const Center(child: Text('Loading...'));
      },
    );
  }
}
