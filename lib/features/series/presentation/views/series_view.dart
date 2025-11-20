import 'package:cinemax_app_new/features/series/presentation/views/series_view_body.dart';
import 'package:flutter/material.dart';

class SeriesView extends StatelessWidget {
  const SeriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: SeriesViewBody()));
  }
}
