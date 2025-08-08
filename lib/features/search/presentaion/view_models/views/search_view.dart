import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manger/search_cubit/search_cubit.dart';
import '../widgets/search_bar_text_filed.dart';
import 'search_view_body.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SearchCubit>(context).getSearchHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: double.infinity,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: SearchBarTextFiled(),
        toolbarHeight: 100,
      ),
      body: SearchViewBody(),
    );
  }
}
