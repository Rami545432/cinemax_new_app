// import 'package:cinemax_app/core/utils/rating.dart';
// import 'package:cinemax_app/features/home/domian/entites/movie_details_entity.dart';
// import 'package:cinemax_app/features/home/presentaion/views_models/widgets/movie_info.dart';
// import 'package:cinemax_app/features/home/presentaion/views_models/widgets/movie_options_button.dart';
// import 'package:flutter/widgets.dart';

// class MovieDataAndSharing extends StatelessWidget {
//   const MovieDataAndSharing({
//     super.key,
//     required this.movieDetailsEntity,
//   });

//   final MovieDetailsEntity movieDetailsEntity;

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       top: 411,
//       left: MediaQuery.of(context).size.width * 0.04,
//       right: MediaQuery.of(context).size.width * 0.04,
//       child: Column(
//         children: [
//           MovieInfo(
//             movieDetailsEntity: movieDetailsEntity,
//           ),
//           const SizedBox(
//             height: 8,
//           ),
//           Rating(
//             rating: 0,
//           ),
//           const SizedBox(
//             height: 24,
//           ),
//           FilmFeaturesOptions(
//             movieDetailsEntity: movieDetailsEntity,
//           ),
//         ],
//       ),
//     );
//   }
// }
