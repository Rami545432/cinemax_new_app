import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/cubit_parameters/params.dart';
import '../../../../../models/base_card_model.dart';
import '../../manger/recommended_movies_cubit/recommended_cubit.dart';
import '../../manger/fetch_movie_details_cubit/fetch_movie_details_cubit.dart';
import 'details_body.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({
    super.key,
    required this.cardModel,
    this.fromRoute = 'home',
  });

  final BaseCardModel cardModel;
  final String fromRoute;

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  void _initializeData() {
    final id = widget.cardModel.cardId;
    final type = widget.cardModel.type ?? '';

    BlocProvider.of<FetchDetailsCubit>(
      context,
    ).fetchDetails(DetailsParams(id: id, type: type));

    BlocProvider.of<FetchRecommendedCubit>(context).fetchData(id, type);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailsBody(
        cardModel: widget.cardModel,
        fromRoute: widget.fromRoute,
      ),
    );
  }
}
