import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../models/base_card_model.dart';
part 'recommended_state.freezed.dart';

@freezed
class RecommendedState with _$RecommendedState {
  const factory RecommendedState.initial() = _Initial;
  const factory RecommendedState.loading() = _Loading;
  const factory RecommendedState.failure(String message) = _Failure;
  const factory RecommendedState.success(List<BaseCardModel> data) = _Success;
}
