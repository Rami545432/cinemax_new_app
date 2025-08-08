// import 'package:flutter/material.dart';

// import '../../../domain/entites/series_season_details_entitiy.dart';
// import 'episode_info_column.dart';
// import 'episode_stack_image.dart';

// class EpisodeComponets extends StatelessWidget {
//   const EpisodeComponets({
//     super.key,
//     required this.seasonDetailsEntitiy,
//   });
//   final SeriesSeasonDetailsEntitiy seasonDetailsEntitiy;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 12, right: 33),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               EpisodeStackImage(
//                 rating: seasonDetailsEntitiy.seasonRating,
//                 imageUrl: seasonDetailsEntitiy.seasonPosterPath,
//               ),
//               SizedBox(
//                 width: 16,
//               ),
//               EpisodeInfoColumn(
//                 episodeDuration: seasonDetailsEntitiy.seasonRating,
//                 episodeName: seasonDetailsEntitiy.seasonName,
//                 episodeNumber: seasonDetailsEntitiy.seasonNum,
//               ),
//             ],
//           ),
//           SizedBox(
//             width: 282,
//             child: EpisodeDescrepttion(
//                 overview: seasonDetailsEntitiy.seasonOverView),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//         ],
//       ),
//     );
//   }
// }
