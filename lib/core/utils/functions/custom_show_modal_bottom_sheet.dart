import 'package:flutter/material.dart';

Future<void> customShowModalBottomSheet({
  required BuildContext context,
  required Widget Function(
    BuildContext context,
    ScrollController scrollController,
  )
  builder,
  double? maxWidth,
}) async {
  await showModalBottomSheet(
    isScrollControlled: true,
    showDragHandle: true,

    useSafeArea: true,
    context: context,
    constraints: BoxConstraints(
      maxWidth: maxWidth ?? MediaQuery.sizeOf(context).width * 0.95,
    ),
    builder: (context) => DraggableScrollableSheet(
      snap: true,
      expand: false,
      snapSizes: const [0.25, 0.55, 0.95],
      builder: (context, scrollController) {
        return builder(context, scrollController);
      },
    ),
  );
}
