import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movify/core/di/service_locator.dart';
import 'package:movify/core/routing/route_name.dart';
import 'package:movify/features/auth/presentation/cubits/session_cubit.dart';
import 'package:movify/features/onboarding/presentation/views/boarding_one_view.dart';
import 'package:movify/features/onboarding/presentation/views/boarding_three_view.dart';
import 'package:movify/features/onboarding/presentation/views/boarding_two_view.dart';
import 'package:movify/features/onboarding/presentation/widgets/onboarding_scaffold.dart';
import 'package:movify/features/settings/presentation/cubits/settings_cubit.dart';

class OnboardingPageView extends StatefulWidget {
  const OnboardingPageView({super.key});

  @override
  State<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView> {
  late final PageController _pageController;
  int _currentIndex = 0;

  static const int _totalPages = 3;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goNext() {
    if (_currentIndex < _totalPages - 1) {
      HapticFeedback.selectionClick();
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOutCubic,
      );
    } else {
      HapticFeedback.mediumImpact();
      _finishOnboarding();
    }
  }

  Future<void> _finishOnboarding() async {
    _pageController.jumpToPage(_totalPages - 1);
    await getIt<SettingsCubit>().completeOnboarding();

    if (!mounted) {
      return;
    }
    await context.read<SessionCubit>().enableGuestMode();

    if (mounted) {
      context.pushReplacementNamed(RouteName.home);
    }
  }

  void _skip() {
    _finishOnboarding();
  }

  @override
  Widget build(BuildContext context) => OnboardingScaffold(
    currentIndex: _currentIndex,
    totalCount: _totalPages,
    buttonText: _currentIndex == _totalPages - 1
        ? 'Start Exploring'
        : 'Continue',
    onNext: _goNext,
    onSkip: _currentIndex == _totalPages - 1 ? null : _skip,
    child: PageView(
      controller: _pageController,
      onPageChanged: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      physics: const BouncingScrollPhysics(),
      children: const [
        BoardingOneView(),
        BoardingTwoView(), // your refactored Favorites content
        BoardingThreeView(),
      ],
    ),
  );
}
