import 'package:flutter/material.dart';

import '../size_config.dart';

double getResponsiveText(BuildContext context, double fontSize) {
  final scaleFactor = getScaleFactor(context);
  final responsiveFontSize = fontSize * scaleFactor;
  final lowerLimit = fontSize * 0.8;
  final upperLimit = fontSize * 1.8;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  if (width < SizeConfig.tablet) {
    return width / 700;
  } else if (width < SizeConfig.desktop) {
    return width / 732;
  } else {
    return width / 1500;
  }
}
