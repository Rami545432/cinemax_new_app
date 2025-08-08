import 'package:cinemax_app_new/features/home/presentaion/views_models/widgets/horizontal_film_card_widgets/horizontal_expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/helper/base_pagination_cubit/base_paginated_cubit.dart';
import '../../../../core/utils/helper/base_pagination_cubit/base_paginated_states.dart';
import '../../../../models/base_card_model.dart';
import '../../../../core/utils/skeletionzed_loading_cards/horizental_card_laoding_page_view_builder.dart';

class GenericHorizontalFilmCardBlocBuilder<
  T extends BasePaginatedCubit<BaseCardModel, dynamic>
>
    extends StatelessWidget {
  const GenericHorizontalFilmCardBlocBuilder({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<T, BasePaginatedStates<BaseCardModel>>(
      builder: (context, state) {
        if (state is BasePaginatedSuccess<BaseCardModel>) {
          return HorizontalExpandablePageView(data: state.newData);
        }
        if (state is BasePaginatedError<BaseCardModel>) {
          return Text(state.errorMessage);
        }

        return HorizentalCardLoadingPageViewBuilder(
          pageController: pageController,
        );
      },
    );
  }
}
