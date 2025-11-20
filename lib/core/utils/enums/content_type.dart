import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'content_type.g.dart';

@HiveType(typeId: 1)
enum ContentType {
  @HiveField(0)
  movies('movie'),
  @HiveField(1)
  series('tv'),
  @HiveField(2)
  seasons('Season'),
  @HiveField(3)
  episodes('Episode');

  final String text;
  const ContentType(this.text);
  String localizedText(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    switch (this) {
      case ContentType.movies:
        return l10n.movies;
      case ContentType.series:
        return l10n.tvShows; // or add a 'series' key to your ARB files
      case ContentType.seasons:
        return l10n.seasons;
      case ContentType.episodes:
        return l10n.episodes;
    }
  }

  Tab localizedTab(BuildContext context) {
    return Tab(text: localizedText(context));
  }

  Tab get tab => Tab(text: text);
}
