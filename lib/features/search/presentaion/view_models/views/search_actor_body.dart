// import 'package:cinemax_app/features/search/presentaion/view_models/manger/search_actor_cubit/seach_actor_cubit.dart';
// import 'package:cinemax_app/features/search/presentaion/view_models/widgets/search_actors_text_field.dart';
// import 'package:cinemax_app/features/search/presentaion/view_models/widgets/search_no_content.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../widgets/seach_actor_bloc_builder.dart';

// class ActorSearchViewBody extends StatelessWidget {
//   const ActorSearchViewBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           const SizedBox(
//             height: 24,
//           ),
//           const SearchActorsTextField(),
//           const SizedBox(
//             height: 30,
//           ),
//           BlocBuilder<SearchActorCubit, SearchActorState>(
//             builder: (context, state) {
//               if (state is SearchActorSuccess) {
//                 if (state.suggestions.isEmpty) {
//                   return const SearchListNoContent();
//                 }
//                 return SearchActorRelatedinfo(
//                   suggestions: state.suggestions,
//                 );
//               }
//               if (state is SearchActorFailure) {
//                 return Text(state.errorMessage);
//               }
//               return Container();
//             },
//           )
//         ],
//       ),
//     );
//   }
// }
