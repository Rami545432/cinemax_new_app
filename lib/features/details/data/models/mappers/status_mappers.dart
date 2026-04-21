import 'package:cinemax_app_new/features/details/domain/enums/status_enum.dart';
import 'package:flutter/material.dart';

String mapStatus(BuildContext context, String status) => switch (status) {
  'Released' => StatusType.released.localized(context),
  'Ended' => StatusType.ended.localized(context),
  'Returning Series' => StatusType.returning.localized(context),
  'In Production' => StatusType.inProduction.localized(context),
  'Canceled' => StatusType.canceled.localized(context),
  _ => StatusType.unknown.localized(context),
};
