// import 'package:cinemax_app_new/core/routing/app_router.dart';
// import 'package:cinemax_app_new/core/utils/get_it.dart';
// import 'package:cinemax_app_new/features/auth/presentation/views_models/cubit/auth_cubit.dart';
// import 'package:cinemax_app_new/features/auth/presentation/views_models/cubit/auth_state.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';

// void useMainHooks() {
//   late final AuthCubit authCubit;
//   late final AppRouters appRouters;
//   useEffect(() {
//     authCubit = getIt.get<AuthCubit>();
//     appRouters = AppRouters(authCubit: authCubit);
//     authCubit.checkAuthStatus();
//     authCubit.stream.listen((state) {
//       if (state is! AuthInitial && state is! AuthLoading) {
//         FlutterNativeSplash.remove();
//       }
//     });
//     return () {
//       appRouters.dispose();
//       authCubit.close();
//     };
//   }, []);
// }
