import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/core/utils/pagination/cubit/category_pagination_cubit.dart';
import 'package:cinemax_app_new/features/home/presentation/views_models/views/category_see_all_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SectionHeader<C extends CategoryPaginationCubit<CAT, T, P>, CAT, T, P>
    extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.category,
    required this.title,
    this.onSeeAll,
    this.itemBuilder,
  });

  final CAT category;
  final String title;

  final VoidCallback? onSeeAll;
  final Widget Function(T item)? itemBuilder;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Text(title, style: AppStyles.textStyle18(context)),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                    value: context.read<C>(),
                    child: CategorySeeAllView<C, CAT, T, P>(
                      category: category,
                      itemBuilder: itemBuilder,
                      title: title,
                    ),
                  ),
                ),
              );
            },
            icon: Icon(Icons.arrow_forward_ios_rounded),
          ),
        ],
      ),
    );
  }
}
