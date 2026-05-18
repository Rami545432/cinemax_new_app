import 'package:flutter/material.dart';
import 'package:movify/core/responsive/get_responsive_text.dart';

abstract class AppStyles {
  static TextStyle textStyle18(BuildContext context) => TextStyle(
    fontSize: getResponsiveText(context, 18),
    fontWeight: FontWeight.w600,
    color: Theme.of(context).colorScheme.onSurface,
  );

  static TextStyle textStyle14(BuildContext context) => TextStyle(
    fontSize: getResponsiveText(context, 14),
    fontWeight: FontWeight.w500,
    color: Theme.of(context).colorScheme.onSurface,
  );

  static TextStyle textStyle12(BuildContext context) => TextStyle(
    fontSize: getResponsiveText(context, 12),
    fontWeight: FontWeight.w500,
    color: Theme.of(context).colorScheme.onSurface,
  );

  static TextStyle textStyle24(BuildContext context) => TextStyle(
    fontSize: getResponsiveText(context, 24),
    fontWeight: FontWeight.w600,
    color: Theme.of(context).colorScheme.onSurface,
  );

  static TextStyle textStyle28(BuildContext context) => TextStyle(
    fontSize: getResponsiveText(context, 28),
    fontWeight: FontWeight.w600,
    color: Theme.of(context).colorScheme.onSurface,
  );

  static TextStyle textStyle16(BuildContext context) => TextStyle(
    fontSize: getResponsiveText(context, 16),
    fontWeight: FontWeight.w600,
    color: Theme.of(context).colorScheme.onSurface,
  );
  static TextStyle textStyle20(BuildContext context) => TextStyle(
    fontSize: getResponsiveText(context, 20),
    fontWeight: FontWeight.w600,
    color: Theme.of(context).colorScheme.onSurface,
  );
}
