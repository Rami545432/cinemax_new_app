import 'package:flutter/material.dart';

import '../size_config.dart';

EdgeInsets getResponsivePadding(
  BuildContext context, {
  double horizontal = 12,
  double vertical = 0,
  double baseHeight = 640,
  double baseWidth = 360,
}) {
  final screenWidth = MediaQuery.sizeOf(context).width;
  final screenHeight = MediaQuery.sizeOf(context).height;
  double scaleFactor;
  if (screenWidth < SizeConfig.mobile) {
    scaleFactor = 0.9;
  } else if (screenWidth < SizeConfig.tablet) {
    scaleFactor = 1;
  } else {
    scaleFactor = 1.2;
  }
  double horizontalPadding =
      (screenWidth / baseWidth) * horizontal * scaleFactor;
  double verticalPadding = (screenHeight / baseHeight) * vertical * scaleFactor;

  return EdgeInsets.symmetric(
    horizontal: horizontalPadding,
    vertical: verticalPadding,
  );
}
