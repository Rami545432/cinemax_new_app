import 'package:cinemax_app_new/features/home/presentation/cubit/movie_view_cubit.dart';
import 'package:cinemax_app_new/features/home/presentation/views_models/widgets/movie_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieViewBody extends StatefulWidget {
  const MovieViewBody({super.key});

  @override
  State<MovieViewBody> createState() => _MovieViewBodyState();
}

class _MovieViewBodyState extends State<MovieViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<MovieViewCubit>().loadAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return MovieBlocBuilder();
  }
}
