import 'package:flutter/material.dart';
import 'package:movify/features/discover/presentation/views/discover_view_body.dart';

class DiscoverView extends StatelessWidget {
  const DiscoverView({super.key});

  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: SafeArea(child: DiscoverViewBody()));
}
