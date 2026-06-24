import 'package:flutter/material.dart';
import 'package:movify/features/details/domain/value_objects/cast.dart';
import 'package:movify/features/details/presentation/widgets/shared/actor_avatar.dart';
import 'package:movify/features/details/presentation/widgets/shared/actor_details.dart';

class ActorListTile extends StatelessWidget {
  const ActorListTile({super.key, required this.actorList});

  final Cast actorList;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Row(
      children: [
        actorList.profilePath != null
            ? ActorAvatar(profilePath: actorList.profilePath!)
            : const CircleAvatar(child: Icon(Icons.person)),
        const SizedBox(width: 16),
        Expanded(child: ActorDetails(actorList: actorList)),
      ],
    ),
  );
}
