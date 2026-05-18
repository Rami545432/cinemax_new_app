import 'package:flutter/material.dart';
import 'package:movify/core/di/service_locator.dart';
import 'package:movify/features/favorite/presentation/cubits/favorite_cubit.dart';
import 'package:movify/features/favorite/presentation/views/favorite_view_body.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  void initState() {
    super.initState();
    final cubit = getIt<FavoriteCubit>();
    cubit.loadFavorites();
  }

  @override
  Widget build(BuildContext context) => const Scaffold(body: FavoriteBody());
}
