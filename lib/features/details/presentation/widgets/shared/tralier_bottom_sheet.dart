import 'package:flutter/material.dart';
import 'package:movify/core/utils/app_styles.dart';
import 'package:movify/features/details/presentation/widgets/shared/youtube_trailer_bottom_sheet.dart';

class TrailersBottomSheet extends StatefulWidget {
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
  State<TrailersBottomSheet> createState() => _TrailersBottomSheetState();
}

class _TrailersBottomSheetState extends State<TrailersBottomSheet> {
  bool _showContent = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        setState(() {
          _showContent = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      color: Theme.of(context).scaffoldBackgroundColor,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
    ),
    child: ListView(
      controller: widget.scrollController,
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
                  color: Colors.grey.withValues(alpha: 0.2),
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
          widget.name,
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

        if (_showContent) ...[
          // YouTube Player
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: YoutubeTrailerBottomSheet(videoKey: widget.videoKey),
          ),
        ] else ...[
          // Loading Skeleton / Spinner
          const SizedBox(
            height: 250,
            child: Center(child: CircularProgressIndicator(color: Colors.red)),
          ),
        ],
      ],
    ),
  );
}
