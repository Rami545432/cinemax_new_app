import 'package:cinemax_app_new/core/di/service_locator.dart';
import 'package:cinemax_app_new/core/network/api/services/tmdb/tmdb_image_size.dart';
import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/features/details/presentation/cubits/fetch_collection_cubit/fetch_collection_cubit.dart';
import 'package:cinemax_app_new/features/details/presentation/cubits/fetch_collection_cubit/fetch_collection_states.dart';
import 'package:cinemax_app_new/features/home/presentation/views_models/widgets/main_vertical_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            ..fetchCollection(collectionId!, movieId!),
      child: BlocBuilder<FetchCollectionCubit, FetchCollectionState>(
        builder: (context, state) {
          if (state is FetchCollectionLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is FetchCollectionSuccess) {
            return GridView.builder(
              itemCount: state.collection.collectionParts.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.6,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                final item = state.collection.collectionParts[index];
                return MainVerticalCard(
                  posterImage: tmdbImageSize(
                    TmdbImageSize.w300,
                    item.cardImage,
                  ),
                  title: item.cardTitle,
                  rating: item.cardRating ?? 0,
                  id: item.cardId,
                  type: item.type,
                  category: '',
                );
              },
            );
          }
          if (state is FetchCollectionFailure) {
            return Center(
              child: Text(state.message, style: AppStyles.textStyle18(context)),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
