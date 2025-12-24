// import 'package:cinemax_app_new/features/home/data/models/see_all_arguments_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';

// import '../../../../../hooks/ui/use_pagination_controller.dart';
// import '../../cubit/see_all_cubit/see_all_cubit.dart';
// import '../widgets/see_all_widgets/see_all_bloc_builder.dart';

// class SeeAllViewBody extends HookWidget {
//   const SeeAllViewBody({super.key, required this.seeAllArgumentsModel});
//   final SeeAllArgumentsModel seeAllArgumentsModel;

//   @override
//   Widget build(BuildContext context) {
//     final scrollController = useScrollController();
//     final paginationController = usePaginationController(
//       scrollController: scrollController,
//       cubit: BlocProvider.of<SeeAllCubit>(context),
//     );
//     return SeeAllBlocBuilder(
//       seeAllArgumentsModel: seeAllArgumentsModel,
//       scrollController: paginationController.scrollController,
//     );
//   }
// }
