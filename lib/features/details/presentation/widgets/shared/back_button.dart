import 'package:cinemax_app_new/core/routing/route_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LeadingBackButton extends StatelessWidget {
  const LeadingBackButton({super.key, required this.fromRoute});

  final String fromRoute;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
      onPressed: () {
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        } else {
          switch (fromRoute) {
            case 'search':
              context.goNamed(RouteName.search);
              break;
            case 'home':
            default:
              context.goNamed(RouteName.home);
          }
        }
      },
    );
  }
}
