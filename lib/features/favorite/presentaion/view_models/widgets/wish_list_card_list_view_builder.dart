// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// import '../../../../../core/utils/go_router.dart';
// import '../../../domain/entities/favorite_entity.dart';
// import 'wish_card.dart';

// class WishListCardListViewBuilder extends StatelessWidget {
//   const WishListCardListViewBuilder({
//     super.key,
//     required this.data,
//   });

//   final List<WishListEntity> data;

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       physics: NeverScrollableScrollPhysics(),
//       itemCount: data.length,
//       itemBuilder: (context, index) {
//         return GestureDetector(
//           onTap: () {
//             if (data[index].type == 'movie') {
//               GoRouter.of(context)
//                   .push(AppRouter.kMovieDetailView, extra: data[index].movieId);
//             } else if (data[index].type == 'tv') {
//               GoRouter.of(context)
//                   .push(AppRouter.kTvDetailsView, extra: data[index].movieId);
//             }
//           },
//           child: WishListCard(
//             wishListEntity: data[index],
//           ),
//         );
//       },
//     );
//   }
// }
