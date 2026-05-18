import 'package:flutter/material.dart';
import 'package:movify/features/details/presentation/core/details_data_navigation.dart';
import 'package:movify/features/details/presentation/views/details_body.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.data, this.heroTag});

  final DetailsNavigationData data;
  final String? heroTag;
  @override
  Widget build(BuildContext context) => Scaffold(
    body: DetailsBody(navigationData: data, heroTag: heroTag),
  );
}
