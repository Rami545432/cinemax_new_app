import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movify/core/formatters/formatted_date_method.dart';
import 'package:movify/core/network/api/services/tmdb/tmdb_image_size.dart';
import 'package:movify/core/utils/app_styles.dart';
import 'package:movify/core/utils/helper/get_gener_name.dart';
import 'package:movify/features/home/presentation/widgets/empty_image.dart';
import 'package:movify/shared/presentation/models/card_display_model.dart';

class MainCard extends StatelessWidget {
  final CardDisplayModel cardModel;
  const MainCard({super.key, required this.cardModel});

  @override
  Widget build(BuildContext context) => Transform.scale(
    scale: 1.4,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Hero(
          tag: 'trending-${cardModel.id}',
          child: Container(
            height: 250,
            width: 175,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: CachedNetworkImage(
                imageUrl: tmdbImageSize(
                  TmdbImageSize.w780,
                  cardModel.posterPath,
                ),
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    const Center(child: EmptyImage()),
              ),
            ),
          ),
        ),
        Text(
          FormattedDateMethods.formatDateYear(cardModel.date ?? ''),
          style: AppStyles.textStyle14(context),
        ),
        SizedBox(
          width: 200,
          child: Text(
            cardModel.title,
            style: AppStyles.textStyle16(
              context,
            ).copyWith(fontWeight: FontWeight.w800),
            textAlign: TextAlign.center,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            Text(
              getGenreName(cardModel.genreIds?.first ?? 28, context),
              style: AppStyles.textStyle14(context),
            ),
            const Icon(Icons.star, color: Colors.yellow, size: 20),
            Text(
              cardModel.rating?.toStringAsFixed(1) ?? '0.0',
              style: AppStyles.textStyle14(context),
            ),
          ],
        ),
      ],
    ),
  );
}
