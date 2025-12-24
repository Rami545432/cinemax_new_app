import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/core/utils/functions/custom_show_modal_bottom_sheet.dart';
import 'package:cinemax_app_new/core/utils/size_config.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/videos.dart';
import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import 'trailer_thumbnail.dart';
import 'youtube_trailer_bottom_sheet.dart';

class TrailersImageListViewBuilder extends StatelessWidget {
  const TrailersImageListViewBuilder({super.key, required this.videos});
  final Videos videos;
  @override
  Widget build(BuildContext context) {
    final languageDirection =
        Localizations.localeOf(context).languageCode == 'ar'
        ? CrossAxisAlignment.end
        : CrossAxisAlignment.start;
    final l10n = AppLocalizations.of(context);
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
        itemBuilder: (context, index) {
          return AspectRatio(
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
          );
        },
      ),
    );
  }
}

class TrailersBottomSheet extends StatelessWidget {
  const TrailersBottomSheet({
    super.key,
    required this.videoKey,
    required this.name,
    required this.scrollController,
  });

  final String videoKey;
  final String name;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      padding: EdgeInsets.symmetric(horizontal: 16),
      children: [
        SizedBox(height: 10),
        Text(
          name,
          style: AppStyles.textStyle18(
            context,
          ).copyWith(fontWeight: FontWeight.w600),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),

        SizedBox(height: 10),
        YoutubeTrailerBottomSheet(videoKey: videoKey),
      ],
    );
  }
}
