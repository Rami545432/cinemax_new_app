import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:movify/core/utils/app_styles.dart';
import 'package:movify/core/utils/enums/content_type.dart';
import 'package:movify/features/details/presentation/widgets/shared/custom_tab_bar.dart';
import 'package:movify/features/favorite/presentation/widgets/favorite_tab_content.dart';
import 'package:movify/l10n/app_localizations.dart';
import 'package:movify/shared/presentation/widgets/keep_alive_wrapper.dart';

class FavoriteBody extends HookWidget {
  const FavoriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(
      initialLength: ContentType.values.length,
      vsync: useSingleTickerProvider(),
    );

    final l10n = AppLocalizations.of(context)!;
    return DefaultTabController(
      length: ContentType.values.length,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxScrolled) => [
          SliverAppBar(
            title: Text(
              l10n.favorites,
              style: AppStyles.textStyle24(
                context,
              ).copyWith(fontWeight: FontWeight.bold),
            ),
            pinned: true,
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          CustomTabBar(
            tabs: ContentType.values
                .map((e) => e.localizedTab(context))
                .toList(),
            controller: tabController,
          ),
        ],
        body: TabBarView(
          controller: tabController,
          children: const [
            KeepAliveWrapper(
              child: FavoriteTabView(contentType: ContentType.movies),
            ),
            KeepAliveWrapper(
              child: FavoriteTabView(contentType: ContentType.series),
            ),
            KeepAliveWrapper(
              child: FavoriteTabView(contentType: ContentType.seasons),
            ),
            KeepAliveWrapper(
              child: FavoriteTabView(contentType: ContentType.episodes),
            ),
          ],
        ),
      ),
    );
  }
}
