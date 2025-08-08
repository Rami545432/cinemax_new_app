import 'package:flutter/material.dart';
import '../widgets/suggested_search_bloc_builder.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SuggestedSearchBlocBuilder();
  }
}
