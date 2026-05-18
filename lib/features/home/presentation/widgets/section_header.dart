import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movify/core/pagination/presentation/cubit/category_pagination_cubit.dart';
import 'package:movify/core/pagination/widgets/category_see_all_view.dart';
import 'package:movify/core/utils/app_styles.dart';

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
  final Widget Function(T item, bool enableHero)? itemBuilder;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(16),
    child: Row(
      children: [
        Text(title, style: AppStyles.textStyle18(context)),
        IconButton(
          onPressed: () {
            Navigator.push<void>(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                  value: context.read<C>(),
                  child: CategorySeeAllView<C, CAT, T, P>(
                    enableHero: false,
                    category: category,
                    itemBuilder: (item, enableHero) =>
                        itemBuilder!(item, false),
                    title: title,
                  ),
                ),
              ),
            );
          },
          icon: const Icon(Icons.arrow_forward_ios_rounded),
        ),
      ],
    ),
  );
}
