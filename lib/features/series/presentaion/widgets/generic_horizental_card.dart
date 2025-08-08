import 'package:cinemax_app_new/features/series/presentaion/widgets/generic_horizontal_film_card_bloc_builder.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/helper/base_pagination_cubit/base_paginated_cubit.dart';
import '../../../../models/base_card_model.dart';

class GenericHorizontalCard<
  T extends BasePaginatedCubit<BaseCardModel, dynamic>
>
    extends StatefulWidget {
  const GenericHorizontalCard({super.key});

  @override
  State<GenericHorizontalCard> createState() =>
      _GenericHorizontalCardState<T>();
}

class _GenericHorizontalCardState<
  T extends BasePaginatedCubit<BaseCardModel, dynamic>
>
    extends State<GenericHorizontalCard<T>> {
  final PageController _pageController = PageController(viewportFraction: 0.9);
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GenericHorizontalFilmCardBlocBuilder<T>(
      pageController: _pageController,
    );
  }
}
