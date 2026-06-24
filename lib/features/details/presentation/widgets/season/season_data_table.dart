import 'package:flutter/material.dart';
import 'package:movify/core/formatters/formatted_time_method.dart';
import 'package:movify/features/details/domain/entites/series_season_details_entitiy.dart';
import 'package:movify/features/details/presentation/widgets/shared/data_cell_text.dart';
import 'package:movify/l10n/app_localizations.dart';

class SeasonDataTable extends StatelessWidget {
  const SeasonDataTable({super.key, required this.data});
  final SeriesSeasonDetailsEntity data;
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
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
      buildTableRow(l10n.episodes, data.seasonEpisodes.length.toString()),
      buildTableRow(l10n.firstAirDate, data.seasonDate),
      buildTableRow(l10n.totalTime, totalTime().toString()),
      buildTableRow(l10n.rating, data.seasonRating.toString()),
    ];

    return Table(children: rows);
  }
}
