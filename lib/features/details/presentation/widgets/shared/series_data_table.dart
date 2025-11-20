import 'package:cinemax_app_new/features/details/data/models/shared_details_models/production_company.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/production_country.dart';
import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../domain/entites/series_details_entity.dart';
import 'data_cell_text.dart';

class SeriesDataTable extends StatelessWidget {
  const SeriesDataTable({super.key, required this.seriesDetailsEntity});
  final SeriesDetailsEntity seriesDetailsEntity;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    TableRow buildDataRow(String label, String value) {
      return TableRow(
        children: [
          DataCellText(text: label),
          DataCellText(text: value),
        ],
      );
    }

    TableRow buildCompaniesRow(List<ProductionCompany> companies) {
      return TableRow(
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
    }

    TableRow buildCountriesRow(List<ProductionCountry> countries) {
      return TableRow(
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
    }

    List<TableRow> createDataRows() {
      return [
        buildDataRow(
          l10n.originalTitle,
          seriesDetailsEntity.seriresTitle ?? '_',
        ),
        buildDataRow('First Air Data', seriesDetailsEntity.firstDate ?? '_'),
        buildDataRow('Last Air Date', seriesDetailsEntity.kLastAirDate ?? '_'),
        buildDataRow(l10n.status, seriesDetailsEntity.seriesStatus ?? '_'),
        buildDataRow(l10n.seasons, seriesDetailsEntity.numOfSeason.toString()),
        buildDataRow(
          l10n.episodes,
          seriesDetailsEntity.numOfEpisoide.toString(),
        ),
        buildCountriesRow(seriesDetailsEntity.countries!),
        buildCompaniesRow(seriesDetailsEntity.companies!),
      ];
    }

    return Table(children: createDataRows());
  }
}
