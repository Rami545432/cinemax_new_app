import 'package:flutter/material.dart';
import 'package:movify/features/onboarding/presentation/widgets/build_grid_card.dart';
import 'package:movify/shared/presentation/widgets/size_config.dart';

class OnBoardingTwoUpperSection extends StatelessWidget {
  const OnBoardingTwoUpperSection({super.key, required this.posters});
  final List<String> posters;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.widthOf(context);
    final crossAxisCount = (width < SizeConfig.tablet) ? 2 : 3;
    final gridSpacing = (width < SizeConfig.tablet) ? 16.0 : 24.0;
    final mainAxisSpacing = (width < SizeConfig.tablet) ? 16.0 : 24.0;
    final horizontalPadding = (width < SizeConfig.tablet) ? 24.0 : 48.0;
    final itemCount = (width < SizeConfig.tablet) ? 2 : 6;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: gridSpacing,
          mainAxisSpacing: mainAxisSpacing,
        ),
        itemCount: itemCount,
        itemBuilder: (context, index) => BuildGridCard(
          poster: posters[index % posters.length],
          index: index,
        ),
      ),
    );
  }
}
