import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_styles.dart';
import '../../../../../../models/movie_details_model/cast.dart';

class ActorName extends StatelessWidget {
  const ActorName({super.key, required this.actorList});

  final Cast actorList;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          actorList.name ?? 'Unknown',
          style: AppStyles.textStyle14(context),
        ),
        SizedBox(
          child: Text(
            actorList.character ?? 'Unknown',
            overflow: TextOverflow.ellipsis,
            style: AppStyles.textStyle12(context).copyWith(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
