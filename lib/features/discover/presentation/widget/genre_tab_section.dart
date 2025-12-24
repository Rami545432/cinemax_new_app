import 'package:cinemax_app_new/core/utils/sub_bar.dart';
import 'package:cinemax_app_new/features/discover/data/models/genre_filter.dart';
import 'package:cinemax_app_new/features/discover/presentation/widget/genre_container_list_view_builder.dart';
import 'package:flutter/material.dart';

class GenreTabSection extends StatelessWidget {
  const GenreTabSection({
    super.key,
    required this.title,
    required this.genreIds,
    required this.names,
    required this.category,
  });
  final String title;
  final List<int> genreIds;
  final List<String> names;
  final GenreCategory category;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SubBar(title: title),
        SizedBox(height: 30),
        GenreContainerListViewBuilder(
          genreIds: genreIds,
          names: names,
          category: category,
        ),
      ],
    );
  }
}
