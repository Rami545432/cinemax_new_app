import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'pagecontroller_state.dart';

class PagecontrollerCubit extends Cubit<PagecontrollerState> {
  final PageController pageController;

  PagecontrollerCubit(this.pageController)
    : super(PagecontrollerState(pageController: pageController));

  @override
  Future<void> close() async {
    pageController.dispose();
    return super.close();
  }
}
