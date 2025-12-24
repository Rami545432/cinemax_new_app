import 'package:cinemax_app_new/core/di/service_locator.dart';
import 'package:cinemax_app_new/features/home/presentation/cubit/series_view_cubit.dart';
import 'package:cinemax_app_new/features/home/presentation/views_models/views/series_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeriesView extends StatelessWidget {
  const SeriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt.get<SeriesViewCubit>(),
      child: const SeriesViewBody(),
    );
  }
}
