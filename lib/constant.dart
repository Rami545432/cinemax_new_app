import 'package:flutter/material.dart';
import 'package:movify/shared/presentation/widgets/size_config.dart';

class Constants {
  static const String defaultProfileImage =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTq2k2sI1nZyFTtoaKSXxeVzmAwIPchF4tjwg&s';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/original/';
  static SliverGridDelegateWithFixedCrossAxisCount sliverGridDelegate(
    double width,
  ) => SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: width > SizeConfig.mobile ? 4 : 3,
    childAspectRatio: width > SizeConfig.mobile ? 0.6 : 0.5,
    crossAxisSpacing: 10,
    mainAxisSpacing: 20,
  );
}
