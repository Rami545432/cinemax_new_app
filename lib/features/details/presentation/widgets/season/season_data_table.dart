import 'package:cinemax_app_new/core/utils/formatters/formatted_time_method.dart';
import 'package:cinemax_app_new/features/details/domain/entites/series_season_details_entitiy.dart';
import 'package:cinemax_app_new/features/details/presentation/widgets/shared/data_cell_text.dart';
import 'package:flutter/material.dart';

class SeasonDataTable extends StatelessWidget {
  const SeasonDataTable({super.key, required this.data});
  final SeriesSeasonDetailsEntity data;
  @override
  Widget build(BuildContext context) {
    TableRow buildTableRow(String title, String value) => TableRow(
      children: [
        DataCellText(text: title),
        DataCellText(text: value),
      ],
    );

    String totalTime() {
      num total = 0;
      for (final episode in data.seasonEpisodes) {
        total += episode.runtime ?? 0;
      }
      if (total == 0) {
        return "_";
      }
      final formattedTime = formmatTime(total.toInt(), context);
      return formattedTime;
    }

    final List<TableRow> rows = [
      buildTableRow("Episodes", data.seasonEpisodes.length.toString()),
      buildTableRow("Air Date", data.seasonDate),
      buildTableRow('Total Time', totalTime().toString()),
      buildTableRow("Rating", data.seasonRating.toString()),
    ];

    return Table(children: rows);
  }
}
