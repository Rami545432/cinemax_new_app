// import 'package:flutter/material.dart';

// import '../../../../../../core/utils/app_styles.dart';
// import '../../../../../series/domain/entites/series_entity_details.dart';
// import 'episode_details.dart';
// import 'episode_image.dart';

// class EpisodeWidget extends StatelessWidget {
//   const EpisodeWidget({
//     super.key,
//     required this.seriesDetailsEntity,
//     required this.episodeType,
//   });

//   final SeriesDetailsEntity seriesDetailsEntity;
//   final EpisodeType episodeType;

//   @override
//   Widget build(BuildContext context) {
//     final episode = switch (episodeType) {
//       EpisodeType.last => seriesDetailsEntity.lastEpisodeAir,
//       EpisodeType.next => seriesDetailsEntity.nextEpisodeAir,
//     };

//     if (episode == null) {
//       return const SizedBox.shrink();
//     }

//     final title = switch (episodeType) {
//       EpisodeType.last => 'Last Episode',
//       EpisodeType.next => 'Next Episode',
//     };

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(title, style: AppStyles.textStyle18(context)),
//         const SizedBox(height: 10),
//         Row(
//           children: [
//             Expanded(
//               flex: 2,
//               child: EpisodeImage(
//                 episodeImageUrl: episode.stillPath,
//                 imageUrl: seriesDetailsEntity.tvBackDropPath,
//               ),
//             ),
//             const SizedBox(width: 10),
//             Expanded(
//               flex: 2,
//               child: EpisodeDetails(
//                 name: episode.name,
//                 episodeNumber: episode.episodeNumber,
//                 seasonNumber: episode.seasonNumber,
//                 airDate: episode.airDate,
//               ),
//             ),
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(Icons.arrow_forward_ios),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

// enum EpisodeType { last, next }
