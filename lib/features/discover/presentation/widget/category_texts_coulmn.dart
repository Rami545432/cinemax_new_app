import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movify/core/language/presentation/cubits/language_cubit.dart';
import 'package:movify/core/utils/app_styles.dart';
import 'package:movify/features/discover/presentation/core/collection_model.dart';

class CategoryTextsColumn extends StatelessWidget {
  const CategoryTextsColumn({super.key, required this.modeModel});

  final CollectionModel modeModel;

  @override
  Widget build(BuildContext context) {
    final langCubit = context.read<LanguageCubit>();
    return Align(
      alignment: langCubit.isRTL ? Alignment.bottomRight : Alignment.bottomLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 8,
        children: [
          Text(
            modeModel.name,
            style: AppStyles.textStyle24(context),
            textAlign: TextAlign.start,
          ),
          Text(
            modeModel.description,
            style: AppStyles.textStyle16(
              context,
            ).copyWith(color: Colors.white.withValues(alpha: 0.8)),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
