import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movify/core/pagination/presentation/bloc/category_pagination_event.dart';
import 'package:movify/features/discover/presentation/blocs/fetch_items_by_keywords_bloc.dart';
import 'package:movify/features/discover/presentation/core/collection_model.dart';
import 'package:movify/features/discover/presentation/views/collection_view_body.dart';

class CollectionView extends StatefulWidget {
  const CollectionView({super.key, required this.collectionModel});
  final CollectionModel collectionModel;

  @override
  State<CollectionView> createState() => _CollectionViewState();
}

class _CollectionViewState extends State<CollectionView> {
  @override
  void initState() {
    final bloc = context.read<FetchItemsByKeywordsBloc>();
    bloc.add(LoadCategoryEvent(widget.collectionModel.type));
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: CollectionViewBody(collectionModel: widget.collectionModel),
  );
}
