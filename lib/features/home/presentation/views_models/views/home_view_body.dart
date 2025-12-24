import 'package:cinemax_app_new/core/utils/keep_alive_wrapper.dart';
import 'package:cinemax_app_new/features/home/presentation/views_models/views/movie_view.dart';
import 'package:cinemax_app_new/features/home/presentation/views_models/views/series_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        KeepAliveWrapper(child: MovieView()),
        KeepAliveWrapper(child: SeriesView()),
      ],
    );
  }
}
