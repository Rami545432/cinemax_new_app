import 'package:cinemax_app_new/config/animations/widgets/animated_page_transition.dart';
import 'package:cinemax_app_new/core/di/service_locator.dart';
import 'package:cinemax_app_new/features/home/presentation/cubit/movie_view_cubit.dart';
import 'package:cinemax_app_new/features/home/presentation/views_models/views/movie_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieView extends StatelessWidget {
  const MovieView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt.get<MovieViewCubit>(),
      child: const AnimatedPageTransition(child: MovieViewBody()),
    );
  }
}
