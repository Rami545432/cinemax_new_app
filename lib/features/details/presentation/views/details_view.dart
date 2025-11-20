import 'package:cinemax_app_new/core/utils/cubit_parameters/details_params.dart';
import 'package:cinemax_app_new/features/details/presentation/cubits/fetch_details_cubit/fetch_details_cubit.dart';
import 'package:cinemax_app_new/models/base_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'details_body.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({
    super.key,
    required this.cardModel,
    this.fromRoute = 'home',
    this.title,
  });

  final BaseCardModel cardModel;
  final String fromRoute;
  final String? title;

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailsBody(
        cardModel: widget.cardModel,
        fromRoute: widget.fromRoute,
        title: widget.title,
      ),
    );
  }
}
