import 'package:cinemax_app_new/config/animations/widgets/animated_list_item.dart';
import 'package:flutter/material.dart';

import '../../../data/models/shared_details_models/cast.dart';
import 'actor_list_tile.dart';

class CastTabBarView extends StatelessWidget {
  final List<Cast> actorList;

  const CastTabBarView({super.key, required this.actorList});

  @override
  Widget build(BuildContext context) {
    if (actorList.isEmpty) {
      return const Center(
        child: Text('No Actors', style: TextStyle(color: Colors.white)),
      );
    }
    return ListView.builder(
      itemCount: actorList.length,
      itemBuilder: (context, index) {
        return AnimatedListItem(
          index: index,
          child: ActorListTile(actorList: actorList[index]),
        );
      },
    );
  }
}
