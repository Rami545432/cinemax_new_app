import 'package:cinemax_app_new/core/utils/formatters/formatted_time_method.dart';
import 'package:cinemax_app_new/features/details/data/models/mappers/status_mappers.dart';
import 'package:cinemax_app_new/features/details/domain/entites/movie_details_entity.dart';
import 'package:cinemax_app_new/features/details/domain/value_objects/production_company.dart';
import 'package:cinemax_app_new/features/details/domain/value_objects/production_country.dart';
import 'package:cinemax_app_new/features/details/presentation/widgets/shared/data_cell_text.dart';
import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDataTable extends StatelessWidget {
  const MovieDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final movieDetailsEntity = context.watch<MovieDetailsEntity>();
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
      buildDataRow(l10n.originalTitle, movieDetailsEntity.movieTitle),
      buildDataRow(
        l10n.status,
        mapStatus(context, movieDetailsEntity.movieStatus),
      ),
      buildDataRow(
        l10n.runtime,
        formmatTime(movieDetailsEntity.duration, context),
      ),
      buildDataRow(l10n.language, movieDetailsEntity.kLanguages ?? '_'),
      buildCountriesRow(movieDetailsEntity.countries ?? []),
      buildCompaniesRow(movieDetailsEntity.companies ?? []),
      buildDataRow(
        l10n.budget,
        l10n.numberFormat(movieDetailsEntity.kBudget ?? 0),
      ),
      buildDataRow(
        l10n.revenue,
        l10n.numberFormat(movieDetailsEntity.kRevenue ?? 0),
      ),
    ];

    return Table(children: createDataRows());
  }
}
