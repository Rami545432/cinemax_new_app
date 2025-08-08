// import 'package:cinemax_app/features/seires/domain/entites/series_entity_details.dart';
// import 'package:flutter/material.dart';
// import '../../../../../core/utils/app_styles.dart';
// import 'episode_bloc_builder.dart';
// import 'season_dialog_.dart';

// class EpisodeColumn extends StatelessWidget {
//   const EpisodeColumn({
//     super.key,
//     required this.seriesEntityDetails,
//   });
//   final SeriesDetailsEntity seriesEntityDetails;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 24),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Episode',
//             style: AppStyles.textStyle18(context),
//           ),
//           SeasonDialog(
//             seriesEntityDetails: seriesEntityDetails,
//           ),
//           EpisodeCardBlocBuilder(),
//         ],
//       ),
//     );
//   }
// }
