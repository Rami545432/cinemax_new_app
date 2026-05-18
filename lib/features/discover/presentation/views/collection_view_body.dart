import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:movify/features/discover/presentation/core/collection_model.dart';
import 'package:movify/features/discover/presentation/widget/category_texts_coulmn.dart';
import 'package:movify/features/discover/presentation/widget/mode_view_body_bloc_builder.dart';
import 'package:movify/features/home/presentation/widgets/opcaity_details_image.dart';

class CollectionViewBody extends HookWidget {
  const CollectionViewBody({super.key, required this.collectionModel});
  final CollectionModel collectionModel;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final scrollController = useScrollController();
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          expandedHeight: width * 0.7,

          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              fit: StackFit.expand,
              children: [
                OpcaityDetailsImage(
                  detailsBackGroundImage: collectionModel.imageUrl,
                ),
                Positioned(
                  bottom: 32,
                  left: 8,
                  right: 8,
                  child: CategoryTextsColumn(modeModel: collectionModel),
                ),
              ],
            ),
          ),
        ),
        ModeViewBodyBlocBuilder(
          modeModel: collectionModel,
          scrollController: scrollController,
        ),
      ],
    );
  }
}
