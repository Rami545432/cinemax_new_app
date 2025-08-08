import '../../../../../core/utils/helper/base_pagination_cubit/base_paginated_cubit.dart';
import '../../../../../core/utils/helper/base_pagination_cubit/base_paginated_states.dart';
import '../../../../../core/utils/use_case/use_case.dart';
import '../../../../../models/base_card_model.dart';
import '../../../../../models/see_all_arguments_model.dart';
import '../../../data/models/page_loader_factory.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'see_all_state_.dart';

class SeeAllCubit extends BasePaginatedCubit<BaseCardModel, NoParam> {
  SeeAllCubit({required SeeAllArgumentsModel seeAllArgumentsModel})
    : super(
        BasePaginatedInitial<BaseCardModel>(),
        PageLoaderFactory.createPageLoader(
          type: seeAllArgumentsModel.type,
          title: seeAllArgumentsModel.title,
        ),
      );
}
