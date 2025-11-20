import 'package:cinemax_app_new/features/details/data/models/shared_details_models/genre.dart';
import 'package:flutter/material.dart';

import 'gener_box.dart';

class GenersRow extends StatelessWidget {
  const GenersRow({super.key, required this.geners});

  final List<Genre> geners;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: geners.asMap().entries.map((gener) {
        return Padding(
          padding: const EdgeInsets.only(right: 20),
          child: GenerBox(gener: gener.value.name),
        );
      }).toList(),
    );
  }
}
