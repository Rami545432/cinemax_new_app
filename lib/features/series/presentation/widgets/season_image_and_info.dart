import 'package:cinemax_app_new/core/utils/size_config.dart';
import 'package:flutter/material.dart';

import '../../../details/presentation/widgets/shared/details_image.dart';
import 'text_column_info.dart';

class SeasonImageAndInfo extends StatelessWidget {
  const SeasonImageAndInfo({
    super.key,
    this.posterPath,
    required this.title,
    required this.date,
    required this.voteAverage,
    required this.defaultImageUrl,
  });

  final String? posterPath;
  final String title;
  final String date;
  final double voteAverage;
  final String? defaultImageUrl;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Row(
      spacing: 20,
      children: [
        Expanded(
          flex: 1,
          child: Hero(
            tag: title,
            child: DetailsImage(
              defaultImageUrl: defaultImageUrl,
              posterPath: posterPath,
            ),
          ),
        ),
        Expanded(
          flex: width > SizeConfig.mobile ? 2 : 1,
          child: TextColumnInfo(
            title: title,
            date: date,
            voteAverage: voteAverage,
          ),
        ),
      ],
    );
  }
}
