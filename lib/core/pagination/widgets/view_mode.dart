import 'package:flutter/material.dart';

enum ViewMode { list, grid }

class ViewToggle extends StatelessWidget {
  final ViewMode mode;
  final ValueChanged<ViewMode> onToggle;

  const ViewToggle({super.key, required this.mode, required this.onToggle});

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      IconButton(
        icon: const Icon(Icons.view_list_rounded),
        color: mode == ViewMode.list
            ? Theme.of(context).colorScheme.onSurface
            : Colors.grey,
        onPressed: () => onToggle(ViewMode.list),
      ),
      IconButton(
        icon: const Icon(Icons.grid_view_rounded),
        color: mode == ViewMode.grid
            ? Theme.of(context).colorScheme.onSurface
            : Colors.grey,
        onPressed: () => onToggle(ViewMode.grid),
      ),
    ],
  );
}
