// import 'package:cinemax_app/core/utils/go_router.dart';
// import 'package:cinemax_app/features/seires/domain/entites/series_season_details_entitiy.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// import '../../../../../core/utils/app_colors.dart';

// import 'episode_componets.dart';

// class EpisodeCard extends StatelessWidget {
//   const EpisodeCard({
//     super.key,
//     required this.seasonDetailsEntitiy,
//   });
//   final SeriesSeasonDetailsEntitiy seasonDetailsEntitiy;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         var id = seasonDetailsEntitiy.seasonId;
//         var seasonNum = seasonDetailsEntitiy.seasonNum;
//         var episodeNumber = seasonDetailsEntitiy.seasonNum;
//         var episodeUrl =
//             'https://vidsrc.xyz/embed/tv/$id/$seasonNum/$episodeNumber';

//         GoRouter.of(context).push(AppRouter.kCustomWebView, extra: episodeUrl);
//       },
//       child: Container(
//         height: null,
//         width: 327,
//         decoration: BoxDecoration(
//           color: AppPrimaryColors.soft,
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: EpisodeComponets(
//           seasonDetailsEntitiy: seasonDetailsEntitiy,
//         ),
//       ),
//     );
//   }
// }
