import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/utils/helper/formatted_time_method.dart';
import '../../../../../../models/movie_details_model/production_company.dart';
import '../../../../../../models/movie_details_model/production_country.dart';
import '../../../../domian/entites/movie_details_entity.dart';
import 'data_cell_text.dart';

class MovieDataTable extends StatelessWidget {
  const MovieDataTable({super.key, required this.movieDetailsEntity});
  final MovieDetailsEntity movieDetailsEntity;

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
      final formatter = NumberFormat.currency(
        locale: 'en_US',
        symbol: '\$',
        decimalDigits: 0,
      );
      return [
        buildDataRow("Original title", movieDetailsEntity.movieTitle),
        buildDataRow('Status', movieDetailsEntity.movieStatus),
        buildDataRow('Runtime', formmatTime(movieDetailsEntity.duration)),
        buildDataRow('Language', movieDetailsEntity.kLanguages ?? '_'),
        buildCountriesRow(movieDetailsEntity.countries ?? []),
        buildCompaniesRow(movieDetailsEntity.companies ?? []),
        buildDataRow('Budget', formatter.format(movieDetailsEntity.kBudget)),
        buildDataRow('Revenue', formatter.format(movieDetailsEntity.kRevenue)),
      ];
    }

    return Table(children: createDataRows());
  }
}
