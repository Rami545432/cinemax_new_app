// import 'package:cinemax_app_new/core/utils/size_config.dart';
// import 'package:cinemax_app_new/features/home/presentation/views_models/widgets/main_vertical_card.dart';
// import 'package:cinemax_app_new/models/base_card_model.dart';
// import 'package:flutter/material.dart';

// class PaginatedItemListViewBuilder extends StatelessWidget {
//   const PaginatedItemListViewBuilder({
//     super.key,
//     required this.items,
//     required this.canLoadMore,
//   });

//   final List<BaseCardModel> items;
//   final bool canLoadMore;

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.sizeOf(context).width;
//     return AspectRatio(
//       aspectRatio: width > SizeConfig.mobile ? 3 : 1.45,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         padding: EdgeInsets.symmetric(horizontal: 16),
//         itemCount: items.length + (canLoadMore ? 1 : 0),
//         itemBuilder: (context, index) {
//           // Show loading indicator at end
//           if (index == items.length) {
//             return Container(
//               width: 60,
//               alignment: Alignment.center,
//               child: CircularProgressIndicator(),
//             );
//           }

//           return Padding(
//             padding: const EdgeInsets.only(right: 12),
//             child: MainVerticalCard(cardModel: items[index]),
//           );
//         },
//       ),
//     );
//   }
// }
