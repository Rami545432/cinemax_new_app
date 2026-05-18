import 'package:flutter/material.dart';
import 'package:movify/features/discover/presentation/core/collection_model.dart';
import 'package:movify/features/discover/presentation/widget/collection_card.dart';
import 'package:movify/shared/presentation/widgets/size_config.dart';

class CollectionGridBuilder extends StatelessWidget {
  const CollectionGridBuilder({super.key, required this.collections});
  final List<CollectionModel> collections;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return GridView.builder(
      itemCount: collections.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: width > SizeConfig.mobile ? 1.8 : 1,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemBuilder: (context, index) =>
          CollectionCard(colllectionModel: collections[index]),
    );
  }
}
