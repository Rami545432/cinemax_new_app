import 'package:cinemax_app_new/core/routing/route_name.dart';
import 'package:cinemax_app_new/core/routing/route_paths.dart';
import 'package:cinemax_app_new/features/onboarding/presentation/views/boarding_one_view.dart';
import 'package:cinemax_app_new/features/onboarding/presentation/views/boarding_three_view.dart';
import 'package:cinemax_app_new/features/onboarding/presentation/views/boarding_two_view.dart';
import 'package:cinemax_app_new/features/onboarding/presentation/views/boarding_zero.view.dart';
import 'package:cinemax_app_new/features/onboarding/presentation/widgets/onboarding_page_view.dart';
import 'package:go_router/go_router.dart';

class OnBoardingRoutes {
  static List<RouteBase> get routes => [
    GoRoute(
      path: RoutePaths.boardingZero,
      name: RouteName.boardingZero,
      builder: (context, state) => const BoardingZeroView(),
    ),

    GoRoute(
      path: RoutePaths.onBoardingPageView,
      name: RouteName.onBoardingPageView,
      builder: (context, state) => const OnboardingPageView(),
    ),
    GoRoute(
      path: RoutePaths.boardingOne,
      name: RouteName.boardingOne,
      builder: (context, state) => const BoardingOneView(),
    ),
    GoRoute(
      path: RoutePaths.boardingTwo,
      name: RouteName.boardingTwo,
      builder: (context, state) => const BoardingTwoView(),
    ),
    GoRoute(
      path: RoutePaths.boardingThree,
      name: RouteName.boardingThree,
      builder: (context, state) => const BoardingThreeView(),
    ),
  ];
}
