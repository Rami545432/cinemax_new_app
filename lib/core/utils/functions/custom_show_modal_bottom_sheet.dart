import 'package:flutter/material.dart';

Future<void> customShowModalBottomSheet({
  required BuildContext context,
  required Widget Function(BuildContext context) builder,
}) async {
  await showModalBottomSheet(
    isScrollControlled: true,
    showDragHandle: true,
    useSafeArea: true,
    context: context,
    constraints: BoxConstraints(
      maxWidth: MediaQuery.sizeOf(context).width * 0.95,
    ),
    builder: builder,
  );
}
