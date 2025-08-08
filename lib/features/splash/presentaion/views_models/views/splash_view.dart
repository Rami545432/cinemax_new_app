import 'package:cinemax_app_new/core/utils/go_router.dart';
import 'package:cinemax_app_new/features/splash/presentaion/views_models/widgets/splash_body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/helper/guest_mode_service.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 250), () {
      _checkUserLoggedIn();
    });

    super.initState();
  }

  void _checkUserLoggedIn() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      User? user = FirebaseAuth.instance.currentUser;
      bool isGuestMode = await GuestModeService.getGuestMode();

      if (!mounted) return;

      if (user != null || isGuestMode) {
        GoRouter.of(context).pushReplacement(AppRouter.kNavigationView);
      } else {
        GoRouter.of(context).pushReplacement(AppRouter.kOnBoarding1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(body: SplashBody()));
  }
}
