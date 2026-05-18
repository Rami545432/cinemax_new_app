import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movify/core/di/service_locator.dart';
import 'package:movify/core/language/presentation/cubits/language_cubit.dart';
import 'package:movify/core/network/presentation/cubit/connectivity_cubit.dart';
import 'package:movify/core/notification/auth_notification_binder.dart';
import 'package:movify/core/theme/cubit/theme_cubit.dart';
import 'package:movify/features/auth/presentation/cubits/session_cubit.dart';
import 'package:movify/features/favorite/presentation/cubits/favorite_cubit.dart';
import 'package:movify/features/settings/presentation/cubits/settings_cubit.dart';
import 'package:movify/main_widgets/custom_material_app.dart';

class MainMultiProvieders extends StatelessWidget {
  const MainMultiProvieders({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => getIt.get<ConnectivityCubit>()),
      BlocProvider.value(value: getIt.get<ThemeCubit>()),
      BlocProvider.value(value: getIt.get<SessionCubit>()..checkAuthStatus()),
      BlocProvider.value(value: getIt.get<SettingsCubit>()..checkSettings()),
      BlocProvider.value(value: getIt.get<LanguageCubit>()),
      BlocProvider(create: (_) => getIt.get<FavoriteCubit>()),
    ],
    child: const AuthNotificationBinder(child: CustomMaterialApp()),
  );
}
