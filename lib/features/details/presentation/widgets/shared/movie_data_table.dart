import 'package:cinemax_app_new/core/utils/helper/formatted_methods/formatted_time_method.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/production_company.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/production_country.dart';
import 'package:cinemax_app_new/features/details/domain/entites/movie_details_entity.dart';
import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'data_cell_text.dart';

class MovieDataTable extends StatelessWidget {
  const MovieDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final movieDetailsEntity = context.watch<MovieDetailsEntity>();
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
      final formatter = NumberFormat.currency(
        locale: 'en_US',
        symbol: '\$',
        decimalDigits: 0,
      );
      return [
        buildDataRow(l10n.originalTitle, movieDetailsEntity.movieTitle),
        buildDataRow(l10n.status, movieDetailsEntity.movieStatus),
        buildDataRow(l10n.runtime, formmatTime(movieDetailsEntity.duration)),
        buildDataRow(l10n.language, movieDetailsEntity.kLanguages ?? '_'),
        buildCountriesRow(movieDetailsEntity.countries ?? []),
        buildCompaniesRow(movieDetailsEntity.companies ?? []),
        buildDataRow(l10n.budget, formatter.format(movieDetailsEntity.kBudget)),
        buildDataRow(
          l10n.revenue,
          formatter.format(movieDetailsEntity.kRevenue),
        ),
      ];
    }

    return Table(children: createDataRows());
  }
}
