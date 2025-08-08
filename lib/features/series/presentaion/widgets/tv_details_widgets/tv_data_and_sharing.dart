// import 'package:cinemax_app/core/utils/rating.dart';
// import 'package:cinemax_app/features/seires/domain/entites/series_entity_details.dart';
// import 'package:cinemax_app/features/seires/presentaion/widgets/tv_details_widgets/tv_features_options.dart';
// import 'package:cinemax_app/features/seires/presentaion/widgets/tv_details_widgets/tv_info.dart';
// import 'package:flutter/widgets.dart';

// class TvDataAndSharing extends StatelessWidget {
//   const TvDataAndSharing({
//     super.key,
//     required this.seriesEntityDetails,
//   });

//   final SeriesDetailsEntity seriesEntityDetails;

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       top: 411,
//       left: MediaQuery.of(context).size.width * 0.04,
//       right: MediaQuery.of(context).size.width * 0.04,
//       child: Column(
//         children: [
//           TvInfo(
//             seriesEntityDetails: seriesEntityDetails,
//           ),
//           const SizedBox(
//             height: 8,
//           ),
//           Rating(
//             rating: seriesEntityDetails.rating,
//           ),
//           const SizedBox(
//             height: 24,
//           ),
//           TvShowFeaturesOptions(
//             seriesEntityDetails: seriesEntityDetails,
//           ),
//         ],
//       ),
//     );
//   }
// }
