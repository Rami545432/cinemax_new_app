// // ignore: unused_import
// import 'dart:developer';

// import 'package:cinemax_app/features/seires/domain/entites/series_season_details_entitiy.dart';
// import 'package:flutter/material.dart';

// import 'episode_card.dart';

// class EpisodeCardListViewBuilder extends StatelessWidget {
//   const EpisodeCardListViewBuilder({
//     super.key,
//     required this.seasons,
//   });
//   final List<SeriesSeasonDetailsEntitiy> seasons;

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
//       itemCount: seasons.length,
//       itemBuilder: (context, index) {
//         return Padding(
//           padding: const EdgeInsets.only(bottom: 16),
//           child: EpisodeCard(
//             seasonDetailsEntitiy: seasons[index],
//           ),
//         );
//       },
//     );
//   }
// }
