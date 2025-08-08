// import 'package:cinemax_app/core/utils/app_colors.dart';
// import 'package:cinemax_app/features/seires/presentaion/manger/fetch_tv_show_details_cubit/fetch_tv_show_details_cubit.dart';
// import 'package:cinemax_app/features/seires/presentaion/widgets/tv_details_widgets/tv_details_list_view_componets.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class TvDetailsBlocBuilder extends StatelessWidget {
//   const TvDetailsBlocBuilder({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<FetchTvShowDetailsCubit, FetchTvShowDetailsState>(
//       builder: (context, state) {
//         if (state is FetchTvShowDetailsSuccess) {
//           return TvDetailsListViewComponets(
//             seriesEntityDetails: state.tvShow,
//           );
//         }
//         if (state is FetchTvShowDetailsFailure) {
//           Text(state.errorMessage);

//         }
//         return Center(
//           child: CircularProgressIndicator(
//             color: AppPrimaryColors.blueAccent,
//           ),
//         );
//       },
//     );
//   }
// }
