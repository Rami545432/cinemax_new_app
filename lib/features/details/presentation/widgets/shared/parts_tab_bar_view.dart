import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movify/core/di/service_locator.dart';
import 'package:movify/core/utils/app_styles.dart';
import 'package:movify/features/details/presentation/cubits/fetch_collection_cubit/fetch_collection_cubit.dart';
import 'package:movify/features/details/presentation/cubits/fetch_collection_cubit/fetch_collection_states.dart';
import 'package:movify/features/details/presentation/extensions/part_extension.dart';
import 'package:movify/features/home/presentation/widgets/main_vertical_card.dart';

class PartsTabBarView extends StatelessWidget {
  const PartsTabBarView({
    super.key,
    required this.collectionId,
    required this.movieId,
  });
  final int? collectionId;
  final int? movieId;

  @override
  Widget build(BuildContext context) {
    if (collectionId == null) {
      return Text('No collection found', style: AppStyles.textStyle18(context));
    }
    return BlocProvider(
      create: (context) =>
          getIt.get<FetchCollectionCubit>()
            ..fetchCollection(collectionId, movieId),
      child: BlocBuilder<FetchCollectionCubit, FetchCollectionState>(
        builder: (context, state) {
          if (state is FetchCollectionLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is FetchCollectionSuccess) {
            return GridView.builder(
              itemCount: state.collection.parts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.6,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                final item = state.collection.parts[index];
                return MainVerticalCard(
                  category: 'parts-$collectionId',
                  cardData: item.toCardDisplay(),
                  imageSize: .w185,
                );
              },
            );
          }
          if (state is FetchCollectionFailure) {
            return Center(
              child: Text(state.message, style: AppStyles.textStyle18(context)),
            );
          }
          return Center(
            child: Text(
              'No Collection Found',
              style: AppStyles.textStyle18(context),
            ),
          );
        },
      ),
    );
  }
}
