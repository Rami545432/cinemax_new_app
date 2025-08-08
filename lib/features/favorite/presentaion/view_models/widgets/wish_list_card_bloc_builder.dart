// import 'package:cinemax_app_new/constant.dart';
// import 'package:cinemax_app_new/features/favorite/presentaion/view_models/widgets/wish_list_no_content.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../manger/get_favorite_cubit/get_favorites_cubit.dart';
// import 'wish_card_loading.dart';
// import 'wish_list_card_list_view_builder.dart';

// class WishListCardBlocBuilder extends StatelessWidget {
//   const WishListCardBlocBuilder({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<GetFavoritesCubit, GetFavoritesState>(
//       listener: (context, state) {
//         if (state is GetFavoritesSuccess) {
//           final currentUser = fireBaseUser.currentUser!.uid;
//           final storedUser = state.favorites[0].userId;

//           if (currentUser != storedUser) {
//             BlocProvider.of<GetFavoritesCubit>(context).clearCache();

//             BlocProvider.of<GetFavoritesCubit>(
//               context,
//             ).getFavoriteItems(currentUser);
//           }
//         }
//       },
//       builder: (context, state) {
//         if (state is GetFavoritesSuccess) {
//           final data = state.favorites;
//           if (data.isEmpty) {
//             return WishListNoContent();
//           }
//           return SizedBox(
//             height: data.length * 200,
//             child: WishListCardListViewBuilder(data: data),
//           );
//         }
//         if (state is GetFavoritesFailure) {
//           return Text(state.errorMessage);
//         }
//         return WishListCardLoading();
//       },
//     );
//   }
// }
