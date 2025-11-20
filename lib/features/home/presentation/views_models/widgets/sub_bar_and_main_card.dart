import 'package:cinemax_app_new/core/routing/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:go_router/go_router.dart';

import '../../../../../core/utils/helper/base_pagination_cubit/base_paginated_cubit.dart';
import '../../../../../core/utils/sub_bar.dart';
import '../../../../../hooks/ui/use_pagination_controller.dart';
import '../../../../../models/base_card_model.dart';
import 'package:cinemax_app_new/features/home/data/models/see_all_arguments_model.dart';
import 'film_card_list_builder.dart';

class SubBarAndMainCard extends HookWidget {
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
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final paginationController = usePaginationController(
      scrollController: scrollController,
      cubit: cubitType,
    );
    return Column(
      spacing: 16,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SubBar(
            onPressed: () async {
              context.pushNamed(
                RouteName.seeAll,
                extra: SeeAllArgumentsModel(
                  data: data,
                  title: title,
                  type: type,
                ),
              );
            },
            title: title,
          ),
        ),
        FilmCardListView(
          data: data,
          scrollController: paginationController.scrollController,
          cubit: cubitType,
          title: title,
        ),
      ],
    );
  }
}
