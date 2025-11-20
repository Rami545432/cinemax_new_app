import 'package:flutter/material.dart';

import '../widgets/search_bar_text_filed.dart';
import 'search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

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
