import 'package:flutter/material.dart';
import 'package:movify/features/details/data/models/mappers/status_mappers.dart';
import 'package:movify/features/details/domain/entites/series_details_entity.dart';
import 'package:movify/features/details/domain/value_objects/production_company.dart';
import 'package:movify/features/details/domain/value_objects/production_country.dart';
import 'package:movify/features/details/presentation/widgets/shared/data_cell_text.dart';
import 'package:movify/l10n/app_localizations.dart';

class SeriesDataTable extends StatelessWidget {
  const SeriesDataTable({super.key, required this.seriesDetailsEntity});
  final SeriesDetailsEntity seriesDetailsEntity;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    TableRow buildDataRow(String label, String value) => TableRow(
      children: [
        DataCellText(text: label),
        DataCellText(text: value),
      ],
    );

    TableRow buildCompaniesRow(List<ProductionCompany> companies) => TableRow(
      children: [
        DataCellText(text: l10n.productionCompany),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: companies
              .take(2)
              .map((e) => DataCellText(text: e.name ?? '_'))
              .toList(),
        ),
      ],
    );

    TableRow buildCountriesRow(List<ProductionCountry> countries) => TableRow(
      children: [
        DataCellText(text: l10n.countries),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: countries
              .take(2)
              .map((e) => DataCellText(text: e.name ?? '_'))
              .toList(),
        ),
      ],
    );

    List<TableRow> createDataRows() => [
      buildDataRow(l10n.originalTitle, seriesDetailsEntity.seriesTitle ?? '_'),
      buildDataRow('First Air Data', seriesDetailsEntity.firstDate ?? '_'),
      buildDataRow('Last Air Date', seriesDetailsEntity.kLastAirDate ?? '_'),
      buildDataRow(
        l10n.status,
        mapStatus(context, seriesDetailsEntity.seriesStatus ?? '__'),
      ),
      buildDataRow(l10n.seasons, seriesDetailsEntity.numOfSeason.toString()),
      buildDataRow(l10n.episodes, seriesDetailsEntity.numOfEpisoide.toString()),
      buildCountriesRow(seriesDetailsEntity.countries!),
      buildCompaniesRow(seriesDetailsEntity.companies!),
    ];

    return Table(children: createDataRows());
  }
}
