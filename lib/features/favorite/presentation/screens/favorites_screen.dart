// import 'dart:developer';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cinemax_app_new/constant.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../cubit/favorite_cubit.dart';

// class FavoritesScreen extends StatefulWidget {
//   final String userId;
//   final String type;

//   const FavoritesScreen({super.key, required this.userId, required this.type});

//   @override
//   State<FavoritesScreen> createState() => _FavoritesScreenState();
// }

// class _FavoritesScreenState extends State<FavoritesScreen> {
//   @override
//   void initState() {
//     super.initState();
//     context.read<FavoriteCubit>().getFavoritesByType(widget.type);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('${widget.type} Favorites')),
//       body: BlocBuilder<FavoriteCubit, FavoriteState>(
//         builder: (context, state) {
//           if (state is FavoriteError) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Error: ${state.message}',
//                     style: const TextStyle(color: Colors.red),
//                   ),
//                   const SizedBox(height: 16),
//                   ElevatedButton(
//                     onPressed: () {
//                       context.read<FavoriteCubit>().getFavoritesByType(
//                         widget.type,
//                       );
//                     },
//                     child: const Text('Retry'),
//                   ),
//                 ],
//               ),
//             );
//           }

//           if (state is FavoritesLoaded) {
//             log('state.favorites.length: ${state.favorites.length}');

//             return ListView.builder(
//               itemCount: state.favorites.length,
//               itemBuilder: (context, index) {
//                 final favorite = state.favorites[index];
//                 return CachedNetworkImage(
//                   imageUrl: '$baseImageUrl${favorite.imageUrl}',
//                   width: 100,
//                   height: 150,
//                   fit: BoxFit.cover,
//                 );
//               },
//             );
//           }

//           return const SizedBox.shrink();
//         },
//       ),
//     );
//   }
// }
