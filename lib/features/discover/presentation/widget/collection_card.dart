import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinemax_app_new/core/network/api/services/tmdb/tmdb_image_size.dart';
import 'package:cinemax_app_new/core/routing/route_name.dart';
import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/features/discover/presentation/core/collection_model.dart';
import 'package:cinemax_app_new/features/onboarding/presentation/widgets/gradient_overlay.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CollectionCard extends StatelessWidget {
  const CollectionCard({super.key, required this.colllectionModel});
  final CollectionModel colllectionModel;
  @override
  Widget build(BuildContext context) {
    log(colllectionModel.imageUrl);
    return GestureDetector(
      onTap: () {
        context.pushNamed(RouteName.modeView, extra: colllectionModel);
      },
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.bottomLeft,
        children: [
          CachedNetworkImage(
            imageUrl: tmdbImageSize(.w500, colllectionModel.imageUrl),
            fit: BoxFit.fill,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(image: imageProvider, fit: .fill),
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          const Positioned.fill(child: GradientOverlay()),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 25),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    colllectionModel.name,
                    style: AppStyles.textStyle20(context),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
