import 'package:flutter/material.dart';
import 'package:movify/features/details/domain/enums/status_enum.dart';

String mapStatus(BuildContext context, String status) => switch (status) {
  'Released' => StatusType.released.localized(context),
  'Ended' => StatusType.ended.localized(context),
  'Returning Series' => StatusType.returning.localized(context),
  'In Production' => StatusType.inProduction.localized(context),
  'Canceled' => StatusType.canceled.localized(context),
  _ => StatusType.unknown.localized(context),
};
