import 'package:cinemax_app_new/core/utils/get_it.dart';
import 'package:cinemax_app_new/features/series/presentation/cubit/series_view_cubit.dart';
import 'package:cinemax_app_new/features/series/presentation/views/series_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeiresTvShowsProviders extends StatelessWidget {
  const SeiresTvShowsProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<SeriesViewCubit>()..loadAllCategories(),
      child: const SeriesView(),
    );
  }
}
