import 'package:cinemax_app_new/core/utils/get_it.dart';
import 'package:cinemax_app_new/features/search/presentaion/view_models/manger/search_cubit/search_cubit.dart';
import 'package:cinemax_app_new/features/search/presentaion/view_models/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchMultiProviders extends StatelessWidget {
  const SearchMultiProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<SearchCubit>()..getSearchHistory(),
      child: const SearchView(),
    );
  }
}
