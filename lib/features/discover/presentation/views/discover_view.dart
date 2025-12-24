import 'package:cinemax_app_new/features/discover/presentation/views/discover_view_body.dart';
import 'package:flutter/material.dart';

class DiscoverView extends StatelessWidget {
  const DiscoverView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: DiscoverViewBody()));
  }
}
