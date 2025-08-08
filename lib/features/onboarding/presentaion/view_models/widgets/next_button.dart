import 'package:cinemax_app_new/core/utils/go_router.dart';
import 'package:cinemax_app_new/core/utils/helper/guest_mode_service.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final page = pageController.page;

        if (page! < 2) {
          pageController.nextPage(
            duration: Durations.medium1,
            curve: Curves.easeInExpo,
          );
        } else if (page == 2) {
          await GuestModeService.setGuestMode(true);
          if (context.mounted) {
            GoRouter.of(context).pushReplacement(AppRouter.kNavigationView);
          }
        }
      },
      child: SvgPicture.asset(image),
    );
  }
}
