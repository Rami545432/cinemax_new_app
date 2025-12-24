// import 'package:cinemax_app_new/core/network/presentation/cubit/connectivity_cubit.dart';
// import 'package:cinemax_app_new/core/utils/helper/base_pagination_cubit/base_paginated_cubit.dart';
// import 'package:cinemax_app_new/core/utils/loading_bloc_builder.dart';
// import 'package:cinemax_app_new/core/utils/retry_button.dart';
// import 'package:cinemax_app_new/core/utils/size_config.dart';
// import 'package:cinemax_app_new/models/base_card_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'main_vertical_card.dart';

// class FilmCardListView extends StatelessWidget {
//   const FilmCardListView({
//     super.key,
//     required this.data,
//     required this.scrollController,
//     required this.cubit,
//     required this.title,
//   });
//   final List<BaseCardModel> data;
//   final ScrollController scrollController;
//   final BasePaginatedCubit cubit;
//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.sizeOf(context).width;
//     return AspectRatio(
//       aspectRatio: width > SizeConfig.mobile ? 3 : 1.45,
//       child: ListView.builder(
//         key: const PageStorageKey('film_list'),
//         controller: scrollController,
//         padding: const EdgeInsets.symmetric(horizontal: 24),
//         itemCount: data.length + 1,
//         physics: const BouncingScrollPhysics(),
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           final connectivityCubit = context.read<ConnectivityCubit>();
//           if (index == data.length) {
//             if (connectivityCubit.isOffline) {
//               return RetryButton(
//                 onRetry: () {
//                   cubit.fetchNextPage();
//                 },
//               );
//             }
//             return LoadingBlocBuilder(cubit: cubit);
//           }
//           final model = data[index];
//           return Padding(
//             padding: const EdgeInsets.only(right: 12),
//             child: MainVerticalCard(cardModel: model, category: title),
//           );
//         },
//       ),
//     );
//   }
// }
