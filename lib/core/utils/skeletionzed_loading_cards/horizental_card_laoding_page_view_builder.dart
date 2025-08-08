import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'horizental_stack_container_loading.dart';

class HorizentalCardLoadingPageViewBuilder extends StatelessWidget {
  const HorizentalCardLoadingPageViewBuilder({
    super.key,
    required PageController pageController,
  }) : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: SizedBox(
        height: 180,
        child: PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          itemCount: 20,
          itemBuilder: (context, index) {
            return HorzientalStackContainerLoading();
          },
        ),
      ),
    );
  }
}
