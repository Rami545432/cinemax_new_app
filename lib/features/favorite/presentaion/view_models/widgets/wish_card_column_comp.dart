// import 'package:cinemax_app_new/core/utils/app_styles.dart';
// import 'package:cinemax_app_new/features/favorite/domain/entities/favorite_entity.dart';
// import 'package:cinemax_app_new/features/favorite/presentaion/view_models/manger/delete_wish_list_cubit/delete_wish_list_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../../core/utils/helper/get_gener_name.dart';

// class WishCardColumnComponets extends StatelessWidget {
//   const WishCardColumnComponets({super.key, required this.wishListEntity});
//   final WishListEntity wishListEntity;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           getGenreName(int.parse(wishListEntity.gener)),
//           style: AppStyles.textStyle12(context).copyWith(color: Colors.white70),
//         ),
//         const SizedBox(height: 6),
//         SizedBox(
//           width: 120,
//           child: Text(
//             wishListEntity.title,
//             style: AppStyles.textStyle14(
//               context,
//             ).copyWith(fontWeight: FontWeight.w600),
//           ),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Text(
//               wishListEntity.type,
//               style: AppStyles.textStyle12(context).copyWith(),
//             ),
//             const SizedBox(width: 8),
//             // const Rating(),
//             const SizedBox(width: 40),
//             IconButton(
//               onPressed: () {
//                 BlocProvider.of<DeleteWishListCubit>(
//                   context,
//                 ).deleteWish(wishListEntity.movieId);
//               },
//               icon: const Icon(Icons.favorite, color: Colors.red),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
