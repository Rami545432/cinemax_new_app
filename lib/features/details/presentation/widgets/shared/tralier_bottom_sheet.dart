import 'package:flutter/material.dart';
import 'package:movify/core/utils/app_styles.dart';
import 'package:movify/features/details/presentation/widgets/shared/youtube_trailer_bottom_sheet.dart';

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
  Widget build(BuildContext context) => ListView(
    controller: scrollController,
    padding: const EdgeInsets.symmetric(horizontal: 16),
    children: [
      const SizedBox(height: 10),
      Text(
        name,
        style: AppStyles.textStyle18(
          context,
        ).copyWith(fontWeight: FontWeight.w600),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),

      const SizedBox(height: 10),
      YoutubeTrailerBottomSheet(videoKey: videoKey),
    ],
  );
}
