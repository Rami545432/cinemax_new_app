import 'package:cinemax_app_new/features/search/presentation/views/search_view_body.dart';
import 'package:cinemax_app_new/features/search/presentation/widgets/search_bar_text_filed.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leadingWidth: double.infinity,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      leading: const SearchBarTextFiled(),
      toolbarHeight: 100,
    ),
    body: const SearchViewBody(),
  );
}
