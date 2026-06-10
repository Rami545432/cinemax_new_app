import 'package:flutter/material.dart';
import 'package:movify/config/animations/widgets/shimmer_loading.dart';

class PaginationShimmer extends StatelessWidget {
  final bool isHorizontal;
  final double height;
  final double itemWidth;
  final int itemCount;

  const PaginationShimmer({
    super.key,
    this.isHorizontal = false,
    this.height = 200,
    this.itemWidth = 130,
    this.itemCount = 20,
  });

  @override
  Widget build(BuildContext context) {
    final list = isHorizontal
        ? SizedBox(
            height: height,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: itemCount,
              itemBuilder: (_, _) => Padding(
                padding: const EdgeInsets.only(right: 12),
                child: _ShimmerBox(width: itemWidth, height: height),
              ),
            ),
          )
        : ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: itemCount,
            itemBuilder: (_, _) => const Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: _ShimmerBox(width: double.infinity, height: 100),
            ),
          );

    return ShimmerLoading(child: list);
  }
}

class _ShimmerBox extends StatelessWidget {
  final double width;
  final double height;

  const _ShimmerBox({required this.width, required this.height});

  @override
  Widget build(BuildContext context) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(12),
        ),
      );
}
