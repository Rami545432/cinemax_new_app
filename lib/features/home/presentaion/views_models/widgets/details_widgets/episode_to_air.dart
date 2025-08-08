import 'package:flutter/material.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../../../../series/data/models/series_details_model/base_episode_to_air.dart';
import 'episode_details.dart';
import 'episode_image.dart';

class EpisodeToAir extends StatelessWidget {
  const EpisodeToAir({
    super.key,
    required this.baseEpisodeToAir,
    required this.imageUrl,
    required this.title,
  });
  final BaseEpisodeToAir? baseEpisodeToAir;
  final String? imageUrl;
  final String? title;

  @override
  Widget build(BuildContext context) {
    if (baseEpisodeToAir == null) {
      return const SizedBox();
    }

    return _buildEpisodeToAir(context);
  }

  Widget _buildEpisodeToAir(BuildContext context) {
    return Column(
      spacing: 20,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title ?? '', style: AppStyles.textStyle18(context)),
        Row(
          spacing: 10,
          children: [
            Expanded(
              flex: 2,
              child: EpisodeImage(
                episodeImageUrl: baseEpisodeToAir!.stillPath,
                imageUrl: imageUrl,
              ),
            ),
            Expanded(
              flex: 3,
              child: EpisodeDetails(
                name: baseEpisodeToAir!.name,
                episodeNumber: baseEpisodeToAir!.episodeNumber,
                seasonNumber: baseEpisodeToAir!.seasonNumber,
                airDate: baseEpisodeToAir!.airDate,
              ),
            ),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ],
    );
  }
}

// class EpisodeToAirNavigationButton extends StatefulWidget {
//   const EpisodeToAirNavigationButton({
//     super.key,
//     required this.baseEpisodeToAir,
//     required this.imageUrl,
//   });

//   final BaseEpisodeToAir? baseEpisodeToAir;
//   final String? imageUrl;

//   @override
//   State<EpisodeToAirNavigationButton> createState() =>
//       _EpisodeToAirNavigationButtonState();
// }

// class _EpisodeToAirNavigationButtonState
//     extends State<EpisodeToAirNavigationButton> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<
//       FetchSeriesSeasonDetailsCubit,
//       FetchSeriesSeasonDetailsState
//     >(
//       builder: (context, state) {
//         return state.maybeWhen(
//           success: (series) {
//             final episode =
//                 series.seasonEpisodes[widget.baseEpisodeToAir!.episodeNumber!
//                     .toInt()];
//             return IconButton(
//               icon: const Icon(Icons.arrow_forward_ios),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => EpisodeView(
//                       episode: episode,
//                       imageUrl: widget.imageUrl ?? '',
//                       allEpisodes: series.seasonEpisodes,
//                     ),
//                   ),
//                 );
//               },
//             );
//           },
//           orElse: () => const SizedBox.shrink(),
//         );
//       },
//     );
//   }
// }
