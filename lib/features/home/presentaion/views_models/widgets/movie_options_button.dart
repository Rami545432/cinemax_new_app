// import 'package:cinemax_app/core/utils/app_colors.dart';
// import 'package:cinemax_app/core/utils/go_router.dart';
// import 'package:cinemax_app/features/home/domian/entites/movie_details_entity.dart';
// import 'package:cinemax_app/core/utils/circle_button.dart';
// import 'package:cinemax_app/features/home/presentaion/views_models/widgets/details_widgets/trailer_button.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:go_router/go_router.dart';
// import 'package:share_plus/share_plus.dart';

// class FilmFeaturesOptions extends StatelessWidget {
//   const FilmFeaturesOptions({super.key, required this.movieDetailsEntity});
//   final MovieDetailsEntity movieDetailsEntity;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         TrailerButton(
//           onTap: () {
//             final movieUrl =
//                 'https://vidsrc.xyz/embed/movie/${movieDetailsEntity.movieId}';
//             // final Uri url = Uri.parse(
//             //     'https://vidsrc.xyz/embed/movie/${movieDetailsEntity.movieId}');
//             // try {
//             //   launchUrl(url);
//             // } catch (e) {
//             //   const Text('Sorry the Movie Not work try Again later !');
//             // }
//             GoRouter.of(context)
//                 .push(Approuter.kCustomWebView, extra: movieUrl);
//           },
//         ),
//         CircleButton(
//           color: AppSecondryColors.orange,
//           icon: Icons.movie,
//           onPressed: () {
//             GoRouter.of(context)
//                 .push(Approuter.kYoutubePlayer, extra: movieDetailsEntity);
//           },
//         ),
//         CircleButton(
//           onPressed: () async {
//             await Share.share(
//                 'https://www.themoviedb.org/movie/${movieDetailsEntity.movieId}');
//           },
//           color: AppPrimaryColors.blueAccent,
//           icon: FontAwesomeIcons.arrowUpRightFromSquare,
//           size: 18,
//         ),
//       ],
//     );
//   }
// }
