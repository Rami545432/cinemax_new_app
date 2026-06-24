import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movify/core/network/api/services/tmdb/tmdb_image_size.dart';
import 'package:movify/features/details/presentation/widgets/shared/avatar_placeholder.dart';

class ReviewAvatar extends StatelessWidget {
  const ReviewAvatar({
    super.key,
    required this.avatarUrl,
    required this.authorName,
  });

  final String? avatarUrl;

  final String authorName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final avatarBorderColor = theme.colorScheme.primaryContainer.withValues(
      alpha: isDark ? 0.25 : 0.4,
    );

    return Container(
      width: 46,
      height: 46,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: avatarBorderColor, width: 1.5),
      ),
      child: avatarUrl != null && avatarUrl!.isNotEmpty
          ? CachedNetworkImage(
              imageUrl: tmdbImageSize(TmdbImageSize.w154, avatarUrl!),
              fit: BoxFit.cover,
              placeholder: (context, url) => ColoredBox(
                color: theme.scaffoldBackgroundColor,
                child: const Center(
                  child: SizedBox(
                    width: 14,
                    height: 14,
                    child: CircularProgressIndicator(
                      strokeWidth: 1.5,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white30),
                    ),
                  ),
                ),
              ),
              errorWidget: (context, url, error) =>
                  AvatarPlaceholder(name: authorName),
            )
          : AvatarPlaceholder(name: authorName),
    );
  }
}
