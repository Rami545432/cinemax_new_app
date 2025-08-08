import 'package:cinemax_app_new/models/base_card_model.dart';

class SeeAllArgumentsModel {
  final List<BaseCardModel> data;
  final String title;
  final String type;

  SeeAllArgumentsModel({
    required this.data,
    required this.title,
    required this.type,
  });
}
