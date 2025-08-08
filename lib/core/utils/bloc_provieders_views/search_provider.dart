import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/search/data/repos/search_repo_impl.dart';
import '../../../features/search/domain/use_case/search_history_use_case.dart';
import '../../../features/search/domain/use_case/search_movie_use_case.dart';
import '../../../features/search/domain/use_case/search_tv_show_use_case.dart';
import '../../../features/search/presentaion/view_models/manger/search_cubit/search_cubit.dart';
import '../../../features/search/presentaion/view_models/views/search_view.dart';
import '../../../features/favorite/data/repos/favorite_repo_impl.dart';
import '../../../features/favorite/domain/use_cases/manage_favorites_use_case.dart';
import '../../../features/favorite/presentation/cubit/favorite_cubit.dart';
import '../get_it.dart';

class SearchMultiProviders extends StatelessWidget {
  const SearchMultiProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchCubit(
            SearchMovieUseCase(searchRepo: getIt.get<SearchRepoImpl>()),
            SearchTvShowUseCase(searchRepo: getIt.get<SearchRepoImpl>()),
            SearchHistoryUseCase(searchRepo: getIt.get<SearchRepoImpl>()),
          ),
        ),
        BlocProvider(
          create: (context) => FavoriteCubit(
            manageFavoritesUseCase: ManageFavoritesUseCase(
              favoriteRepo: getIt.get<FavoriteRepoImpl>(),
            ),
          ),
        ),
      ],
      child: const SearchView(),
    );
  }
}
