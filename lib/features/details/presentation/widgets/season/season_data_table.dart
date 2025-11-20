import 'package:cinemax_app_new/core/utils/helper/formatted_methods/formatted_time_method.dart';
import 'package:flutter/material.dart';

import '../shared/data_cell_text.dart';
import '../../../domain/entites/series_season_details_entitiy.dart';

class SeasonDataTable extends StatelessWidget {
  const SeasonDataTable({super.key, required this.data});
  final SeriesSeasonDetailsEntitiy data;
  @override
  Widget build(BuildContext context) {
    TableRow buildTableRow(String title, String value) {
      return TableRow(
        children: [
          DataCellText(text: title),
          DataCellText(text: value),
        ],
      );
    }

    String totalTime() {
      num total = 0;
      for (var episode in data.seasonEpisodes) {
        total += episode.runtime ?? 0;
      }
      if (total == 0) {
        return "_";
      }
      final formattedTime = formmatTime(total.toInt());
      return formattedTime;
    }

    List<TableRow> rows = [
      buildTableRow("Episodes", data.seasonEpisodes.length.toString()),
      buildTableRow("Air Date", data.seasonDate),
      buildTableRow('Total Time', totalTime().toString()),
      buildTableRow("Rating", data.seasonRating.toString()),
    ];

    return Table(children: rows);
  }
}
