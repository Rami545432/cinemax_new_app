import 'package:cinemax_app_new/core/utils/get_it.dart';
import 'package:cinemax_app_new/features/home/presentation/cubit/home_view_cubit.dart';
import 'package:cinemax_app_new/features/home/presentation/views_models/views/home_view.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewProviders extends StatelessWidget {
  const HomeViewProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt.get<HomeViewCubit>()..initialize(),
      child: const HomeView(),
    );
  }
}
