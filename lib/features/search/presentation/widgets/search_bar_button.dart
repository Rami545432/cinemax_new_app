import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:movify/features/search/presentation/widgets/closed_search_container.dart';
import 'package:movify/features/search/presentation/widgets/search_provider.dart';

class SearchBarButton extends StatelessWidget {
  const SearchBarButton({super.key});

  @override
  Widget build(BuildContext context) => OpenContainer(
    transitionType: ContainerTransitionType.fadeThrough,
    transitionDuration: const Duration(milliseconds: 600),
    closedElevation: 0,
    openColor: Theme.of(context).colorScheme.primary,
    useRootNavigator: true,
    closedColor: Theme.of(context).colorScheme.primary,
    closedBuilder: (context, action) => const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),

      child: ClosedSearchContainer(),
    ),
    openBuilder: (context, action) => const SearchMultiProviders(),
  );
}
