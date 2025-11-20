import 'package:cinemax_app_new/core/routing/route_name.dart';
import 'package:cinemax_app_new/core/utils/functions/show_snack_bar.dart';
import 'package:cinemax_app_new/core/utils/get_it.dart';
import 'package:cinemax_app_new/features/auth/data/data_soureces/auth_local_data_source.dart';
import 'package:cinemax_app_new/features/auth/presentation/views_models/cubit/auth_cubit.dart';
import 'package:cinemax_app_new/features/auth/presentation/views_models/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required this.image,
    required this.pageController,
  });

  final String image;
  final PageController pageController;
  Future<void> _finishOnboarding(BuildContext context) async {
    final localDataSource = getIt.get<AuthLocalDataSourceImpl>();
    await localDataSource.setFirstTime(false);

    if (!context.mounted) return;

    // Access AuthCubit directly - no need to provide it
    context.read<AuthCubit>().enableGuestMode();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthGuest) {
          context.goNamed(RouteName.home);
        } else if (state is AuthAuthenticated) {
          context.goNamed(RouteName.home);
        } else if (state is AuthError) {
          showSnackBar(context, color: Colors.red, text: state.message);
        }
      },
      child: GestureDetector(
        onTap: () async {
          final page = pageController.page;

          if (page! < 2) {
            pageController.nextPage(
              duration: Durations.medium1,
              curve: Curves.easeInExpo,
            );
          } else if (page == 2) {
            await _finishOnboarding(context);
          }
        },
        child: SvgPicture.asset(image),
      ),
    );
  }
}
