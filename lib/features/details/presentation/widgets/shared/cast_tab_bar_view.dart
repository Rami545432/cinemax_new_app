import 'package:flutter/material.dart';
import 'package:movify/config/animations/widgets/animated_list_item.dart';
import 'package:movify/features/details/domain/value_objects/cast.dart';
import 'package:movify/features/details/presentation/widgets/shared/actor_list_tile.dart';

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
      itemBuilder: (context, index) => AnimatedListItem(
        index: index,
        child: ActorListTile(actorList: actorList[index]),
      ),
    );
  }
}
