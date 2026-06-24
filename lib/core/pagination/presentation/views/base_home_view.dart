import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movify/core/pagination/presentation/bloc/category_pagination_bloc.dart';
import 'package:movify/core/pagination/presentation/bloc/category_pagination_event.dart';
import 'package:movify/core/pagination/presentation/bloc/category_pagination_state.dart';
import 'package:movify/shared/presentation/widgets/size_config.dart';

abstract class BaseHomeScreen<
  B extends CategoryPaginationBloc<CAT, T, P>,
  CAT,
  T,
  P
>
    extends StatelessWidget {
  const BaseHomeScreen({super.key});

  Widget buildCategoryRow(BuildContext context, B bloc, CAT category);

  List<CAT> get categories;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<B>();
    final width = MediaQuery.widthOf(context);
    final isMobile = width < SizeConfig.tablet;

    return Scaffold(
      body: RefreshIndicator(
        color: Colors.white,
        onRefresh: () => onRefresh(bloc),
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final cat = categories[index];
            return Padding(
              padding: EdgeInsets.only(top: isMobile ? 16 : 64),
              child: buildCategoryRow(context, bloc, cat),
            );
          },
        ),
      ),
    );
  }

  Future<void> onRefresh(B bloc) async {
    bloc.add(const LoadAllCategoriesEvent());
    await bloc.stream.firstWhere(
      (state) =>
          state is CategoryPaginationLoaded<CAT, T, P> &&
          categories.every(
            (cat) => !state.getPaginationInfo(cat).isFetchingFirstPage,
          ),
    );
  }
}
