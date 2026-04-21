import 'package:cinemax_app_new/core/di/service_locator.dart';
import 'package:cinemax_app_new/features/home/presentation/blocs/movie_bloc.dart';
import 'package:cinemax_app_new/features/home/presentation/blocs/series_bloc.dart';
import 'package:cinemax_app_new/features/home/presentation/views/movie_view.dart';
import 'package:cinemax_app_new/features/home/presentation/views/series_view.dart';
import 'package:cinemax_app_new/shared/presentation/widgets/keep_alive_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) => TabBarView(
    children: [
      KeepAliveWrapper(
        child: BlocProvider.value(
          value: getIt.get<MovieBloc>(),
          child: const MovieView(),
        ),
      ),
      KeepAliveWrapper(
        child: BlocProvider.value(
          value: getIt.get<SeriesBloc>(),
          child: const SeriesView(),
        ),
      ),
    ],
  );
}
