// import 'package:cinemax_app/features/seires/domain/entites/series_entity_details.dart';
// import 'package:cinemax_app/features/seires/presentaion/manger/fetch_series_season_details_cubit/fetch_series_season_details_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../../core/utils/app_colors.dart';
// import '../../../../../core/utils/app_styles.dart';

// class SeasonDialog extends StatefulWidget {
//   const SeasonDialog({
//     super.key,
//     required this.seriesEntityDetails,
//   });
//   final SeriesDetailsEntity seriesEntityDetails;
//   @override
//   State<SeasonDialog> createState() => _SeasonDialogState();
// }

// class _SeasonDialogState extends State<SeasonDialog> {
//   int selectedSeason = 1;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Text(
//           'Season $selectedSeason',
//           style: AppStyles.textStyle14(context)
//               .copyWith(fontWeight: FontWeight.w600),
//         ),
//         IconButton(
//           onPressed: () async {
//             final int? season = await showDialog<int>(
//               context: context,
//               builder: (context) => AlertDialog(
//                 backgroundColor: AppPrimaryColors.dark,
//                 contentPadding:
//                     const EdgeInsets.symmetric(horizontal: 75, vertical: 68),
//                 content: SizedBox(
//                   height: 351,
//                   width: 327,
//                   child: ListView.builder(
//                     itemCount: widget.seriesEntityDetails.numOfSeason.toInt(),
//                     itemBuilder: (context, index) {
//                       int displayIndex = index + 1;
//                       return Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 19),
//                         child: GestureDetector(
//                           onTap: () async {
//                             BlocProvider.of<FetchSeriesSeasonDetailsCubit>(
//                                     context)
//                                 .fetchSeriesSeasonDetail(
//                                     tvid:
//                                         widget.seriesEntityDetails.tvId.toInt(),
//                                     season: displayIndex);
//                             Navigator.pop(context, displayIndex);
//                           },
//                           child: Text(
//                             'Season $displayIndex',
//                             style: selectedSeason == displayIndex
//                                 ? AppStyles.textStyle24(context)
//                                 : AppStyles.textStyle24(context)
//                                     .copyWith(color: Colors.grey),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             );

//             if (season != null) {
//               setState(() {
//                 selectedSeason = season;
//               });
//             }
//           },
//           icon: const Icon(Icons.keyboard_arrow_down_outlined),
//         ),
//       ],
//     );
//   }
// }
