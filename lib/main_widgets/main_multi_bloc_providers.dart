import 'package:cinemax_app_new/core/network/presentation/cubit/connectivity_cubit.dart';
import 'package:cinemax_app_new/core/routing/app_router.dart';
import 'package:cinemax_app_new/core/theme/cubit/theme_cubit.dart';
import 'package:cinemax_app_new/core/utils/get_it.dart';
import 'package:cinemax_app_new/features/auth/presentation/views_models/cubit/auth_cubit.dart';
import 'package:cinemax_app_new/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:cinemax_app_new/l10n/local_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_material_app.dart';

class MainMultiProvieders extends StatelessWidget {
  final AppRouters appRouters;
  const MainMultiProvieders({super.key, required this.appRouters});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ConnectivityCubit>.value(
          value: getIt.get<ConnectivityCubit>(),
        ),
        BlocProvider.value(value: getIt.get<ThemeCubit>()),

        BlocProvider(
          create: (context) => getIt.get<FavoriteCubit>()..loadAllFavorites(),
        ),
        BlocProvider.value(value: getIt.get<AuthCubit>()),
        BlocProvider.value(value: getIt.get<LocaleCubit>()),
      ],
      child: CustomMaterialApp(appRouters: appRouters),
    );
  }
}
