import 'package:cinemax_app_new/core/di/service_locator.dart';
import 'package:cinemax_app_new/core/language/presentation/cubits/language_cubit.dart';
import 'package:cinemax_app_new/core/language/presentation/cubits/language_state.dart';
import 'package:cinemax_app_new/core/utils/pagination/presentation/bloc/category_pagination_event.dart';
import 'package:cinemax_app_new/features/home/presentation/blocs/series_bloc.dart';
import 'package:cinemax_app_new/features/home/presentation/views/series_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeriesView extends StatelessWidget {
  const SeriesView({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocListener<LanguageCubit, LanguageState>(
        listener: (context, state) {
          getIt.get<SeriesBloc>().add(const LoadAllCategoriesEvent());
        },
        child: const SeriesViewBody(),
      );
}
