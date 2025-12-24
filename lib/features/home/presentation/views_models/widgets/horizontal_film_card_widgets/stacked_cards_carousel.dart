import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinemax_app_new/constant.dart';
import 'package:cinemax_app_new/core/network/api/services/tmdb/tmdb_image_size.dart';
import 'package:cinemax_app_new/core/routing/route_name.dart';
import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/core/utils/enums/content_type.dart';
import 'package:cinemax_app_new/core/utils/helper/formatted_methods/formatted_date_method.dart';
import 'package:cinemax_app_new/core/utils/helper/get_gener_name.dart';
import 'package:cinemax_app_new/models/base_card_model.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class StackedCardsCarousel extends StatefulWidget {
  final List<BaseCardModel> cardModel;

  const StackedCardsCarousel({super.key, required this.cardModel});

  @override
  State<StackedCardsCarousel> createState() => _StackedCardsCarouselState();
}

class _StackedCardsCarouselState extends State<StackedCardsCarousel> {
  int current = 0;

  void _next() {
    setState(() => current = (current + 1) % widget.cardModel.length);
  }

  void _prev() {
    setState(
      () => current =
          (current - 1 + widget.cardModel.length) % widget.cardModel.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    final center = current;
    final left =
        (current - 1 + widget.cardModel.length) % widget.cardModel.length;
    final left2 =
        (current - 2 + widget.cardModel.length) % widget.cardModel.length;

    final right = (current + 1) % widget.cardModel.length;
    final right2 = (current + 2) % widget.cardModel.length;
    return GestureDetector(
      onTap: () {
        final routeName =
            widget.cardModel[center].contentType == ContentType.movies
            ? RouteName.movieDetail
            : RouteName.tvDetail;
        context.pushNamed(
          routeName,
          pathParameters: {'id': widget.cardModel[center].cardId.toString()},
          queryParameters: {
            'title': 'trending',
            'heroTag': 'trending-${widget.cardModel[center].cardId}',
            'posterImage': widget.cardModel[center].cardImage,
          },
        );
      },
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! < 0) _next();
        if (details.primaryVelocity! > 0) _prev();
      },
      child: SizedBox(
        height: 420,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // LEFT CARD
            Positioned(
              right: 200,

              child: Transform.rotate(
                angle: -12.6,
                child: _MiniCard(image: widget.cardModel[left2].cardImage),
              ),
            ),

            Positioned(
              right: 175,

              child: Transform.rotate(
                angle: -12.6,
                child: _MiniCard(image: widget.cardModel[left].cardImage),
              ),
            ),

            // RIGHT CARD
            Positioned(
              left: 200,

              child: Transform.rotate(
                angle: 12.6,
                child: _MiniCard(image: widget.cardModel[right2].cardImage),
              ),
            ),

            Positioned(
              left: 175,

              child: Transform.rotate(
                angle: 12.6,
                child: _MiniCard(image: widget.cardModel[right].cardImage),
              ),
            ),

            // CENTER CARD
            Positioned(child: _MainCard(cardModel: widget.cardModel[center])),
          ],
        ),
      ),
    );
  }
}

class _MainCard extends StatelessWidget {
  final BaseCardModel cardModel;
  const _MainCard({required this.cardModel});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: 'trending-${cardModel.cardId}',
            child: Container(
              height: 250,
              width: 175,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: CachedNetworkImage(
                  imageUrl: tmdbImageSize(
                    TmdbImageSize.w780,
                    cardModel.cardImage,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text(
            FormattedDateMethods.formatDateYear(cardModel.cardDate ?? ''),
            style: AppStyles.textStyle14(context),
          ),
          SizedBox(
            width: 200,
            child: Text(
              cardModel.cardTitle,
              style: AppStyles.textStyle16(
                context,
              ).copyWith(fontWeight: FontWeight.w800),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text(
                getGenreName(cardModel.cardGeners?.first ?? 0, context),
                style: AppStyles.textStyle14(context),
              ),
              Icon(Icons.star_rate_outlined, color: Colors.yellow, size: 20),
              Text(
                cardModel.cardRating?.toStringAsFixed(1) ?? '0.0',
                style: AppStyles.textStyle14(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MiniCard extends StatelessWidget {
  final String image;

  const _MiniCard({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 150,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(32)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: CachedNetworkImage(
          imageUrl: tmdbImageSize(TmdbImageSize.w300, image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
