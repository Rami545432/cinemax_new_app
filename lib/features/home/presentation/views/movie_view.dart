import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movify/core/di/service_locator.dart';
import 'package:movify/core/language/presentation/cubits/language_cubit.dart';
import 'package:movify/core/language/presentation/cubits/language_state.dart';
import 'package:movify/core/pagination/presentation/bloc/category_pagination_event.dart';
import 'package:movify/features/home/presentation/blocs/movie_bloc.dart';
import 'package:movify/features/home/presentation/views/movie_view_body.dart';

class MovieView extends StatelessWidget {
  const MovieView({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocListener<LanguageCubit, LanguageState>(
        listener: (context, state) {
          getIt.get<MovieBloc>().add(const LoadAllCategoriesEvent());
        },
        child: const MovieViewBody(),
      );
}
