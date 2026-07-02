import 'package:flutter/material.dart';
import 'package:movify/core/utils/app_styles.dart';
import 'package:movify/features/details/presentation/widgets/shared/youtube_trailer_bottom_sheet.dart';
import 'package:movify/core/ads/banner_ad_widget.dart';

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
  Widget build(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      color: Theme.of(context).scaffoldBackgroundColor,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
    ),
    child: ListView(
      controller: scrollController,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      children: [
        // Top Drag Handle & Close Button Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 40,
            ), // Placeholder to balance the close button
            // Drag Handle

            // Close Button
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.close, size: 18),
              ),
              splashRadius: 20,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Trailer Title
        Text(
          name,
          style: AppStyles.textStyle18(
            context,
          ).copyWith(fontWeight: FontWeight.bold, letterSpacing: 0.5),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 16),
        const Divider(height: 1, thickness: 1),
        const SizedBox(height: 24),

        // YouTube Player
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: YoutubeTrailerBottomSheet(videoKey: videoKey),
        ),

        const SizedBox(height: 32),

        // Banner Ad
        const Center(child: BannerAdWidget()),
      ],
    ),
  );
}
