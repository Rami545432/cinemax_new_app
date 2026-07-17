import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:movify/core/di/service_locator.dart';
import 'package:movify/core/routing/route_name.dart';
import 'package:movify/features/auth/presentation/cubits/session_cubit.dart';
import 'package:movify/features/auth/presentation/cubits/session_state.dart';
import 'package:movify/features/settings/presentation/cubits/settings_cubit.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required this.image,
    required this.pageController,
  });

  final String image;
  final PageController pageController;
  Future<void> _finishOnboarding(BuildContext context) async {
    final settingsCubit = getIt.get<SettingsCubit>();
    await settingsCubit.completeOnboarding();

    if (!context.mounted) {
      return;
    }

    context.read<SessionCubit>().enableGuestMode();
  }

  @override
  Widget build(BuildContext context) =>
      BlocListener<SessionCubit, SessionState>(
        listener: (context, state) {
          if (state is SessionGuest) {
            context.goNamed(RouteName.home);
          } else if (state is SessionAuthenticated) {
            context.goNamed(RouteName.home);
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
