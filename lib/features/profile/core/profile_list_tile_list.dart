import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:movify/core/language/presentation/widgets/languages_switcher.dart';
import 'package:movify/core/routing/route_name.dart';
import 'package:movify/core/theme/widgets/theme_mode_color_selector.dart';
import 'package:movify/features/profile/core/profile_list_tile_model.dart';
import 'package:movify/l10n/app_localizations.dart';

List<ProfileIstTileModel> profileListTileList(BuildContext context) {
  final l10n = AppLocalizations.of(context)!;
  return [
    ProfileIstTileModel(
      title: l10n.favorites,
      icon: const FaIcon(FontAwesomeIcons.heart),
      onTap: () {
        context.goNamed(RouteName.favorite);
      },
    ),
    ProfileIstTileModel(
      title: l10n.searchHistory,
      icon: const FaIcon(FontAwesomeIcons.clockRotateLeft),
      onTap: () {
        context.pushNamed(RouteName.search);
      },
    ),
    ProfileIstTileModel(
      title: l10n.language,
      icon: const FaIcon(FontAwesomeIcons.language),
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          showDragHandle: true,
          constraints: BoxConstraints(
            maxWidth: MediaQuery.widthOf(context) * 0.95,
          ),
          builder: (context) => const LanguagesSwitcher(),
        );
      },
    ),

    ProfileIstTileModel(
      icon: const FaIcon(FontAwesomeIcons.palette),
      title: l10n.theme,
      onTap: () {
        showModalBottomSheet<void>(
          isScrollControlled: true,
          showDragHandle: true,
          useSafeArea: true,
          context: context,
          constraints: BoxConstraints(
            maxWidth: MediaQuery.widthOf(context) * 0.95,
          ),
          builder: (context) => const ThemeModeColorSelector(),
        );
      },
    ),
  ];
}
