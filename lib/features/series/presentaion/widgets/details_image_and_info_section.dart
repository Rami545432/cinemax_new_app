import 'package:flutter/material.dart';

import '../../../../core/utils/size_config.dart';
import '../../../home/presentaion/views_models/widgets/details_widgets/details_image.dart';
import 'text_column_info.dart';

class DetailsImageAndInfoSection extends StatelessWidget {
  const DetailsImageAndInfoSection({
    super.key,
    required this.posterPath,
    required this.title,
    required this.date,
    required this.voteAverage,
  });

  final String posterPath;
  final String title;
  final String date;
  final double voteAverage;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Row(
      spacing: 20,
      children: [
        Expanded(
          flex: 1,
          child: DetailsImage(imageUrl: posterPath),
        ),
        Expanded(
          flex: width > SizeConfig.mobile ? 2 : 1,
          child: TextColumnInfo(
            title: title,
            date: date,
            voteAverage: voteAverage,
          ),
        )
      ],
    );
  }
}
