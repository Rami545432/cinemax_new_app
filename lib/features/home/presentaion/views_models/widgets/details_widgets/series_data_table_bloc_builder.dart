import 'package:flutter/material.dart';

import '../../../../../../models/movie_details_model/production_company.dart';
import '../../../../../../models/movie_details_model/production_country.dart';
import '../../../../../series/domain/entites/series_entity_details.dart';
import 'data_cell_text.dart';

class SeriesDataTableBlocBuilder extends StatelessWidget {
  const SeriesDataTableBlocBuilder({
    super.key,
    required this.seriesDetailsEntity,
  });
  final SeriesDetailsEntity seriesDetailsEntity;

  @override
  Widget build(BuildContext context) {
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
          DataCellText(text: 'Companies'),
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
          DataCellText(text: 'Countries'),
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
        buildDataRow('Original title', seriesDetailsEntity.seriresTitle ?? '_'),
        buildDataRow('First Air Data', seriesDetailsEntity.firstDate ?? '_'),
        buildDataRow('Last Air Date', seriesDetailsEntity.kLastAirDate ?? '_'),
        buildDataRow('Status', seriesDetailsEntity.seriesStatus ?? '_'),
        buildDataRow('Seasons', seriesDetailsEntity.numOfSeason.toString()),
        buildDataRow('Episodes', seriesDetailsEntity.numOfEpisoide.toString()),
        buildCountriesRow(seriesDetailsEntity.countries!),
        buildCompaniesRow(seriesDetailsEntity.companies!),
      ];
    }

    return Table(children: createDataRows());
  }
}
