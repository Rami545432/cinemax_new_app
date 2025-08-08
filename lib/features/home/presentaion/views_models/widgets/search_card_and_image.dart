import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinemax_app_new/constant.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/rating.dart';

class SearchCardAndImage extends StatelessWidget {
  const SearchCardAndImage({
    super.key,
    required this.imageUrl,
    required this.rating,
  });

  final String imageUrl;
  final num rating;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.7,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: CachedNetworkImageProvider('$baseImageUrl$imageUrl'),
          ),
        ),
        child: Rating(rating: rating),
      ),
    );
  }
}
