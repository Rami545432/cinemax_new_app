// import 'package:cinemax_app/constant.dart';
// import 'package:cinemax_app/features/home/domian/entites/movie_details_entity.dart';
// import 'package:cinemax_app/features/home/presentaion/views_models/widgets/details_widgets/detail_info_box.dart';
// import 'package:flutter/material.dart';

// class DetailsInfoBoxesColumn extends StatelessWidget {
//   const DetailsInfoBoxesColumn({
//     super.key,
//     required this.movieDetailsEntity,
//   });
//   final MovieDetailsEntity movieDetailsEntity;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       spacing: 20,
//       children: [
//         DetailInfoBox(
//             info: getGenreName(movieDetailsEntity.[0]),
//             icons: Icons.videocam_sharp,
//             text: 'Gener'),
//         DetailInfoBox(
//             info: "${movieDetailsEntity.duration.toString()} Min",
//             icons: Icons.watch_later,
//             text: 'Duration'),
//         DetailInfoBox(
//             info: "${movieDetailsEntity.rating.toStringAsFixed(1)} / 10",
//             icons: Icons.star,
//             text: 'Rating'),
//       ],
//     );
//   }
// }
