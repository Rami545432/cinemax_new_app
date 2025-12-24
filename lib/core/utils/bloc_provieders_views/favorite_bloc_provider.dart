import 'package:cinemax_app_new/core/di/service_locator.dart';
import 'package:cinemax_app_new/features/favorite/presentation/views/favorite_view.dart';
import 'package:cinemax_app_new/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteBlocProviders extends StatelessWidget {
  const FavoriteBlocProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<FavoriteCubit>()..loadAllFavorites(),
      child: const FavoriteView(),
    );
  }
}
