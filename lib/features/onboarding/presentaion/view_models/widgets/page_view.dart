import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manger/pagecontrollerCubit/pagecontroller_cubit.dart';
import '../views/on_boarding_view_one.dart';
import '../views/on_boarding_view_three.dart.dart';
import '../views/on_boarding_view_two.dart.dart';

class OnBoardingTransistion extends StatelessWidget {
  const OnBoardingTransistion({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PagecontrollerCubit(PageController()),
      child: BlocBuilder<PagecontrollerCubit, PagecontrollerState>(
        builder: (context, state) {
          return PageView(
            controller: state.pageController,
            children: const [
              OnBoardingViewOne(),
              OnBoardingViewTwo(),
              OnBoardingViewThree(),
            ],
          );
        },
      ),
    );
  }
}
