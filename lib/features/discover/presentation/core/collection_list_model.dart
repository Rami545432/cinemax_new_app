import 'package:flutter/material.dart';
import 'package:movify/features/discover/presentation/core/collection_model.dart';
import 'package:movify/features/discover/presentation/core/enums/type_enum.dart';
import 'package:movify/l10n/app_localizations.dart';

class CollectionListModel {
  static List<CollectionModel> movieCollections(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return [
      CollectionModel(
        name: l10n.cartoons,
        imageUrl: '/w9kR8qbmQ01HwnvK4alvnQ2ca0L.jpg', // toy story
        description: l10n.cartoonDescreption,
        type: TypeEnum.movie,
        keyword: 6513,
      ),
      CollectionModel(
        name: l10n.maifa,
        imageUrl: '/loSpBeirRfTPJ3cMIqpQArstGhh.jpg', // the godfather
        description: l10n.mafiaDescreption,
        type: TypeEnum.movie,
        keyword: 10391,
      ),
      CollectionModel(
        name: l10n.anime,
        imageUrl: '/fWVSwgjpT2D78VUh6X8UBd2rorW.jpg', // demon slayer
        description: l10n.animeDescreption,
        type: TypeEnum.movie,
        keyword: 210024,
      ),
      CollectionModel(
        name: l10n.marvel,
        imageUrl: '/9BBTo63ANSmhC4e6r62OJFuK2GL.jpg', // avengers
        description: l10n.marvelDescreption,
        type: TypeEnum.movie,
        keyword: 180547,
      ),
    ];
  }

  static List<CollectionModel> tvCollections(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return [
      CollectionModel(
        name: l10n.cartoons,
        imageUrl: '/qk3eQ8jW4opJ48gFWYUXWaMT4l.jpg', // adventure time
        description: l10n.cartoonDescreption,
        type: TypeEnum.tv,
        keyword: 6513,
      ),
      CollectionModel(
        name: l10n.maifa,
        imageUrl: '/rTc7ZXdroqjkKivFPvCPX0Ru7uw.jpg', // The Sopranos
        description: l10n.mafiaDescreption,
        type: TypeEnum.tv,
        keyword: 10391,
      ),
      CollectionModel(
        name: l10n.anime,
        imageUrl: '/fHpKWq9ayzSk8nSwqRuaAUemRKh.jpg', // attack on titan
        description: l10n.animeDescreption,
        type: TypeEnum.tv,
        keyword: 210024,
      ),
      CollectionModel(
        name: l10n.marvel,
        imageUrl: '/gHUCCMy1vvj58tzE3dZqeC9SXus.jpg', // Agents of S.H.I.E.L.D
        description: l10n.marvelDescreption,
        type: TypeEnum.tv,
        keyword: 180547,
      ),
    ];
  }
}
