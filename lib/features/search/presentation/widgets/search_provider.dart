import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movify/core/di/service_locator.dart';
import 'package:movify/features/search/presentation/blocs/search_bloc.dart';
import 'package:movify/features/search/presentation/cubits/search_history_cubit.dart';
import 'package:movify/features/search/presentation/views/search_view.dart';

class SearchMultiProviders extends StatelessWidget {
  const SearchMultiProviders({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => getIt.get<SearchBloc>()),
      BlocProvider(
        create: (context) =>
            getIt.get<SearchHistoryCubit>()..getSearchHistory(),
      ),
    ],
    child: const SearchView(),
  );
}
