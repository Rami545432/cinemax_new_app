import 'package:flutter/material.dart';
import 'package:movify/core/utils/app_styles.dart';

class MetaDataReview extends StatelessWidget {
  const MetaDataReview({
    super.key,
    required this.authorName,
    required this.displayUsername,
    required this.formattedDate,
  });

  final String authorName;
  final String? displayUsername;
  final String formattedDate;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final authorNameColor = theme.colorScheme.onSurface;
    final handleColor = theme.colorScheme.primaryContainer;
    final dateColor = theme.colorScheme.onSurfaceVariant;
    final dotColor = theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.5);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          authorName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppStyles.textStyle16(
            context,
          ).copyWith(fontWeight: FontWeight.w700, color: authorNameColor),
        ),
        if (displayUsername != null ||
            (formattedDate.isNotEmpty && formattedDate != 'Unknown')) ...[
          const SizedBox(height: 2),
          Row(
            children: [
              if (displayUsername != null) ...[
                Flexible(
                  child: Text(
                    displayUsername!,
                    maxLines: 1,

                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.textStyle12(
                      context,
                    ).copyWith(color: handleColor, fontWeight: FontWeight.w500),
                  ),
                ),
                if (formattedDate.isNotEmpty && formattedDate != 'Unknown') ...[
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    width: 3,
                    height: 3,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: dotColor,
                    ),
                  ),
                ],
              ],
              if (formattedDate.isNotEmpty && formattedDate != 'Unknown')
                Text(
                  formattedDate,
                  style: AppStyles.textStyle12(
                    context,
                  ).copyWith(color: dateColor, fontWeight: FontWeight.w400),
                ),
            ],
          ),
        ],
      ],
    );
  }
}
