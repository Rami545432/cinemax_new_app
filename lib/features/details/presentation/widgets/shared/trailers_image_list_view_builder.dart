import 'package:flutter/material.dart';
import 'package:movify/core/utils/app_styles.dart';
import 'package:movify/features/details/domain/value_objects/videos.dart';
import 'package:movify/features/details/presentation/widgets/shared/trailer_thumbnail.dart';
import 'package:movify/features/details/presentation/widgets/shared/tralier_bottom_sheet.dart';
import 'package:movify/l10n/app_localizations.dart';
import 'package:movify/shared/presentation/utils/custom_show_modal_bottom_sheet.dart';
import 'package:movify/shared/presentation/widgets/size_config.dart';

class TrailersImageListViewBuilder extends StatelessWidget {
  const TrailersImageListViewBuilder({super.key, required this.videos});
  final Videos videos;
  @override
  Widget build(BuildContext context) {
    final languageDirection =
        Localizations.localeOf(context).languageCode == 'ar'
        ? CrossAxisAlignment.end
        : CrossAxisAlignment.start;
    final l10n = AppLocalizations.of(context)!;
    final width = MediaQuery.sizeOf(context).width;
    final videoKey = videos.results?.map((e) => e.key).toList() ?? [];
    final style = AppStyles.textStyle14(
      context,
    ).copyWith(fontWeight: FontWeight.w600);
    if (videoKey.isEmpty) {
      return Center(child: Text(l10n.noTrailersAvailable, style: style));
    }
    return AspectRatio(
      aspectRatio: width > SizeConfig.mobile ? 3.7 : 1.7,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: videoKey.length,
        itemBuilder: (context, index) => AspectRatio(
          aspectRatio: 1.4,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              spacing: 10,
              crossAxisAlignment: languageDirection,
              children: [
                TrailerThumbnail(
                  videoKey: videoKey[index]!,
                  onTap: () {
                    customShowModalBottomSheet(
                      context: context,
                      builder: (context, scrollController) =>
                          TrailersBottomSheet(
                            name: videos.results?[index].name ?? '',
                            scrollController: scrollController,
                            videoKey: videoKey[index]!,
                          ),
                    );
                  },
                ),
                Text(
                  videos.results?[index].name ?? '',
                  style: style,

                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
