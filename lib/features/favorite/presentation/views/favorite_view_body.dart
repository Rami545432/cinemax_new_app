import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/core/utils/enums/content_type.dart';
import 'package:cinemax_app_new/features/favorite/presentation/widgets/favorite_build_list.dart';
import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../details/presentation/widgets/shared/custom_tab_bar.dart';

class FavoriteBody extends HookWidget {
  const FavoriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(
      initialLength: ContentType.values.length,
      vsync: useSingleTickerProvider(),
      animationDuration: const Duration(milliseconds: 300),
    );
    final l10n = AppLocalizations.of(context);
    return DefaultTabController(
      length: ContentType.values.length,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxScrolled) {
          return [
            SliverAppBar(
              title: Text(
                l10n.favorites,
                style: AppStyles.textStyle24(
                  context,
                ).copyWith(fontWeight: FontWeight.bold),
              ),
              centerTitle: true,

              pinned: true,
            ),
            CustomTabBar(
              tabs: ContentType.values
                  .map((e) => e.localizedTab(context))
                  .toList(),
              controller: tabController,
            ),
          ];
        },
        body: TabBarView(
          controller: tabController,
          children: [
            FavoriteBuildList(type: ContentType.movies),
            FavoriteBuildList(type: ContentType.series),
            FavoriteBuildList(type: ContentType.seasons),
            FavoriteBuildList(type: ContentType.episodes),
          ],
        ),
      ),
    );
  }
}
