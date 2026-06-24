import 'package:flutter/material.dart';
import 'package:movify/features/details/domain/value_objects/cast.dart';
import 'package:movify/features/details/presentation/widgets/shared/actor_list_tile.dart';
import 'package:movify/l10n/app_localizations.dart';
import 'package:movify/shared/presentation/widgets/premium_staggered_entrance.dart';

class CastTabBarView extends StatefulWidget {
  final List<Cast> actorList;

  const CastTabBarView({super.key, required this.actorList});

  @override
  State<CastTabBarView> createState() => _CastTabBarViewState();
}

class _CastTabBarViewState extends State<CastTabBarView> {
  // This set keeps track of which items have already been animated.
  final Set<int> _animatedIndices = {};

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (widget.actorList.isEmpty) {
      return Center(
        child: Text(
          l10n!.noActors,
          style: const TextStyle(color: Colors.white),
        ),
      );
    }
    return ListView.builder(
      itemCount: widget.actorList.length,
      itemBuilder: (context, index) => PremiumStaggeredEntrance(
        index: index,
        isAnimated: _animatedIndices.contains(index),
        markAsAnimated: () => _animatedIndices.add(index),
        child: ActorListTile(actorList: widget.actorList[index]),
      ),
    );
  }
}
