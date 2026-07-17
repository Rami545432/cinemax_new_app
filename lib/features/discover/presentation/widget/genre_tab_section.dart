import 'package:flutter/material.dart';
import 'package:movify/features/discover/domain/entities/genre_filter.dart';
import 'package:movify/features/discover/presentation/widget/genre_container_list_view_builder.dart';
import 'package:movify/shared/presentation/widgets/sub_bar.dart';

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
  Widget build(BuildContext context) => Column(
    children: [
      SubBar(title: title),
      const SizedBox(height: 30),
      GenreContainerListViewBuilder(
        genreIds: genreIds,
        names: names,
        category: category,
      ),
    ],
  );
}
