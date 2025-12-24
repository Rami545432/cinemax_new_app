import 'package:cinemax_app_new/features/home/presentation/cubit/series_view_cubit.dart';
import 'package:cinemax_app_new/features/home/presentation/views_models/widgets/series_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeriesViewBody extends StatefulWidget {
  const SeriesViewBody({super.key});

  @override
  State<SeriesViewBody> createState() => _SeriesViewBodyState();
}

class _SeriesViewBodyState extends State<SeriesViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<SeriesViewCubit>().loadAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return SeriesBLocBuilder();
  }
}
