import 'package:flutter/material.dart';

import '../../../../../models/see_all_arguments_model.dart';
import 'see_all_view_body.dart';

class SeeAllView extends StatelessWidget {
  const SeeAllView({super.key, required this.seeAllArgumentsModel});
  final SeeAllArgumentsModel seeAllArgumentsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SeeAllViewBody(seeAllArgumentsModel: seeAllArgumentsModel),
      ),
    );
  }
}
