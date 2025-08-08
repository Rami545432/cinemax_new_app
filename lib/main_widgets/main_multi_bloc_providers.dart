import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/utils/get_it.dart';
import '../features/favorite/data/repos/favorite_repo_impl.dart';
import '../features/favorite/domain/use_cases/manage_favorites_use_case.dart';
import '../features/favorite/presentation/cubit/favorite_cubit.dart';
import 'custom_material_app.dart';

class MainMultiProvieders extends StatelessWidget {
  const MainMultiProvieders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FavoriteCubit(
            manageFavoritesUseCase: ManageFavoritesUseCase(
              favoriteRepo: getIt.get<FavoriteRepoImpl>(),
            ),
          ),
        ),
      ],
      child: CustomMaterialApp(),
    );
  }
}
