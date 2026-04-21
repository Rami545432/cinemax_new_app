import 'package:cinemax_app_new/core/di/service_locator.dart';
import 'package:cinemax_app_new/core/language/presentation/cubits/language_cubit.dart';
import 'package:cinemax_app_new/core/network/presentation/cubit/connectivity_cubit.dart';
import 'package:cinemax_app_new/core/notification/auth_notification_binder.dart';
import 'package:cinemax_app_new/core/theme/cubit/theme_cubit.dart';
import 'package:cinemax_app_new/features/auth/presentation/cubits/session_cubit.dart';
import 'package:cinemax_app_new/features/favorite/presentation/cubits/favorite_cubit.dart';
import 'package:cinemax_app_new/features/settings/presentation/cubits/settings_cubit.dart';
import 'package:cinemax_app_new/main_widgets/custom_material_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainMultiProvieders extends StatelessWidget {
  const MainMultiProvieders({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
    providers: [
      BlocProvider<ConnectivityCubit>.value(
        value: getIt.get<ConnectivityCubit>(),
      ),
      BlocProvider.value(value: getIt.get<ThemeCubit>()),
      BlocProvider.value(value: getIt.get<SessionCubit>()),
      BlocProvider.value(value: getIt.get<SettingsCubit>()),
      BlocProvider.value(value: getIt.get<LanguageCubit>()),
      BlocProvider.value(value: getIt.get<FavoriteCubit>()),
    ],
    child: const AuthNotificationBinder(child: CustomMaterialApp()),
  );
}
