import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import '../../../../../core/utils/controllers/pagination_controller.dart';
import '../../../../../core/utils/go_router.dart';
import '../../../../../core/utils/helper/base_pagination_cubit/base_paginated_cubit.dart';

import '../../../../../core/utils/sub_bar.dart';
import '../../../../../models/base_card_model.dart';
import '../../../../../models/see_all_arguments_model.dart';
import 'film_card_list_builder.dart';

class SubBarAndMainCard extends StatefulWidget {
  const SubBarAndMainCard({
    super.key,
    required this.data,
    required this.title,
    required this.type,
    required this.cubitType,
  });
  final List<BaseCardModel> data;
  final String title, type;
  final BasePaginatedCubit cubitType;

  @override
  State<SubBarAndMainCard> createState() => _SubBarAndMainCardState();
}

class _SubBarAndMainCardState extends State<SubBarAndMainCard> {
  late ScrollController scrollController;
  late PaginationController<BasePaginatedCubit> paginationHandler;
  @override
  void initState() {
    scrollController = ScrollController();
    paginationHandler = PaginationController(
      cubit: widget.cubitType,
      scrollController: scrollController,
    );
    super.initState();
  }

  @override
  void dispose() {
    paginationHandler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SubBar(
            onPressed: () async {
              GoRouter.of(context).push(
                AppRouter.kSeeAllView,
                extra: SeeAllArgumentsModel(
                  data: widget.data,
                  title: widget.title,
                  type: widget.type,
                ),
              );
            },
            title: widget.title,
          ),
        ),
        FilmCardListView(
          data: widget.data,
          scrollController: scrollController,
          cubit: widget.cubitType,
        ),
      ],
    );
  }
}
