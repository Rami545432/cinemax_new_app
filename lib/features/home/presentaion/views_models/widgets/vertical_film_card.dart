// import 'package:cinemax_app/features/home/data/models/media_model.dart';
// import 'package:cinemax_app/features/home/presentaion/views_models/widgets/main_vertical_card.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// class VerticalCard extends StatelessWidget {
//   const VerticalCard({
//     super.key,
//     required this.id,
//     required this.imageUrl,
//     required this.title,
//     required this.gener,
//     required this.rating,
//     required this.locataion,
//     required this.generState, required this.medaiModel,
//   });

//   final int id;
//   final String imageUrl, title, locataion;
//   final List<int> gener;
//   final num rating;
//   final int generState;
//     final List<MediaModel> medaiModel;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         GoRouter.of(context).push(locataion, extra: id);
//       },
//       child: MainVerticalCard(
//         imageUrl: imageUrl,
//         title: title,
//         rating: rating,
//       ),
//     );
//   }
// }
