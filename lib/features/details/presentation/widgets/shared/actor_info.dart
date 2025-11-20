import 'package:flutter/material.dart';

import '../../../data/models/shared_details_models/cast.dart';
import 'actor_list_tile.dart';

class ActorInfo extends StatelessWidget {
  final List<Cast> actorList;

  const ActorInfo({super.key, required this.actorList});

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
        return ActorListTile(actorList: actorList[index]);
      },
    );
  }
}
