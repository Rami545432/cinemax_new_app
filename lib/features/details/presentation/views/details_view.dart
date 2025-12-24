import 'package:cinemax_app_new/core/utils/enums/content_type.dart';
import 'package:flutter/material.dart';
import 'details_body.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({
    super.key,
    required this.id,
    required this.contentType,
    this.fromRoute = 'home',
    this.heroTag,
    required this.posterImage,
  });

  final int id;
  final ContentType contentType;
  final String fromRoute;
  final String? heroTag;
  final String posterImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailsBody(
        id: id,
        contentType: contentType,
        fromRoute: fromRoute,
        heroTag: heroTag,
        posterImage: posterImage,
      ),
    );
  }
}
