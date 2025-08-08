import 'package:cinemax_app_new/core/utils/controllers/pagination_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../models/see_all_arguments_model.dart';
import '../../manger/see_all_cubit/see_all_cubit.dart';
import '../widgets/see_all_widgets/see_all_bloc_builder.dart';

class SeeAllViewBody extends StatefulWidget {
  const SeeAllViewBody({super.key, required this.seeAllArgumentsModel});
  final SeeAllArgumentsModel seeAllArgumentsModel;
  @override
  State<SeeAllViewBody> createState() => _SeeAllViewBodyState();
}

class _SeeAllViewBodyState extends State<SeeAllViewBody> {
  late ScrollController scrollController;
  late PaginationController paginationController;

  @override
  void initState() {
    scrollController = ScrollController();
    paginationController = PaginationController<SeeAllCubit>(
      cubit: BlocProvider.of<SeeAllCubit>(context),
      scrollController: scrollController,
    );
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SeeAllBlocBuilder(
      seeAllArgumentsModel: widget.seeAllArgumentsModel,
      scrollController: scrollController,
    );
  }
}
