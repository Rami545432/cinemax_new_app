// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../features/home/presentaion/views_models/widgets/favorite_button.dart';
// import '../../../features/wishList/data/repos/wish_list_repo_impl.dart';
// import '../../../features/wishList/domain/use_cases/add_wish_list_use_case.dart';
// import '../../../features/wishList/domain/use_cases/delete_wish_case_use_case.dart';
// import '../../../features/wishList/presentaion/view_models/manger/add_wish_list_cubit/add_wish_list_cubit.dart';
// import '../../../features/wishList/presentaion/view_models/manger/delete_wish_list_cubit/delete_wish_list_cubit.dart';
// import '../get_it.dart';

// class FavoriteButtonBlocProvider extends StatelessWidget {
//   const FavoriteButtonBlocProvider({
//     super.key,
//     required this.widget,
//   });

//   final DetailsViewAppbar widget;

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [

//         BlocProvider(
//           create: (context) => AddWishListCubit(
//             AddWishListUseCase(
//               wishListRepo: getIt.get<WishListRepo>(),
//             ),
//           ),
//         ),
//         BlocProvider(
//           create: (context) => DeleteWishListCubit(
//             DeleteWishCaseUseCase(
//               wishListRepo: getIt.get<WishListRepo>(),
//             ),
//           ),
//         ),
//       ],
//       child: FavoriteButton(
//         imageUrl: widget.imageUrl,
//         title: widget.title,
//         type: widget.type,
//         gener: widget.gener,
//         movieId: widget.movieId,
//       ),
//     );
//   }
// }
