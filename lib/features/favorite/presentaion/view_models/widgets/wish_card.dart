// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cinemax_app_new/constant.dart';
// import 'package:cinemax_app_new/features/favorite/domain/entities/favorite_entity.dart';
// import 'package:cinemax_app_new/features/favorite/presentaion/view_models/widgets/wish_card_column_comp.dart';
// import 'package:flutter/material.dart';

// import '../../../../../core/utils/app_colors.dart';

// class WishListCard extends StatelessWidget {
//   const WishListCard({super.key, required this.wishListEntity});
//   final WishListEntity wishListEntity;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16.0),
//       child: Container(
//         height: MediaQuery.of(context).size.height * 0.18,
//         width: MediaQuery.of(context).size.width * 1.5,
//         decoration: BoxDecoration(
//           color: AppPrimaryColors.soft,
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: Row(
//           children: [
//             const SizedBox(width: 12),
//             ClipRRect(
//               borderRadius: BorderRadius.circular(16),
//               child: SizedBox(
//                 height: 83,
//                 width: 121,
//                 child: CachedNetworkImage(
//                   fit: BoxFit.fill,
//                   imageUrl: '$baseImageUrl${wishListEntity.imageUrl}',
//                 ),
//               ),
//             ),
//             const SizedBox(width: 16),
//             WishCardColumnComponets(wishListEntity: wishListEntity),
//           ],
//         ),
//       ),
//     );
//   }
// }
