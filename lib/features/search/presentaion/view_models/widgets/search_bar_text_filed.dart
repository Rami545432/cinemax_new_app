import 'dart:async';

import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import '../manger/search_cubit/search_cubit.dart';

class SearchBarTextFiled extends HookWidget {
  const SearchBarTextFiled({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    void onChangedQuery(String query) {
      BlocProvider.of<SearchCubit>(context).searchItems(query);
    }

    final searchController = useSearchController();
    final debounceTimer = useRef<Timer?>(null);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: SearchBar(
        backgroundColor: WidgetStateProperty.all(
          Theme.of(context).colorScheme.primary,
        ),
        onChanged: (query) {
          if (debounceTimer.value?.isActive ?? false) {
            debounceTimer.value?.cancel();
          }
          debounceTimer.value = Timer(const Duration(milliseconds: 500), () {
            onChangedQuery(query);
          });
        },
        autoFocus: true,
        controller: searchController,
        hintText: l10n.searchHint,

        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        trailing: [
          IconButton(
            onPressed: () {
              searchController.clear();
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }
}
