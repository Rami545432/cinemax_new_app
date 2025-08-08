import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manger/search_cubit/search_cubit.dart';

class SearchBarTextFiled extends StatefulWidget {
  const SearchBarTextFiled({super.key});

  @override
  State<SearchBarTextFiled> createState() => _SearchBarTextFiledState();
}

class _SearchBarTextFiledState extends State<SearchBarTextFiled> {
  late SearchController _searchController;
  Timer? _debounce;
  void _onChangedQuery(String query) {
    BlocProvider.of<SearchCubit>(context).searchItems(query);
  }

  @override
  void initState() {
    super.initState();
    _searchController = SearchController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: SearchBar(
        onChanged: (query) {
          if (_debounce?.isActive ?? false) {
            _debounce?.cancel();
          }
          _debounce = Timer(const Duration(milliseconds: 500), () {
            _onChangedQuery(query);
          });
        },
        autoFocus: true,
        controller: _searchController,
        hintText: 'Search for movies, series, etc',

        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        trailing: [
          IconButton(
            onPressed: () {
              _searchController.clear();
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }
}
