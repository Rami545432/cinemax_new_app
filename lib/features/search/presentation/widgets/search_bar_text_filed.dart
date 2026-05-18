import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:movify/features/search/presentation/blocs/search_bloc.dart';
import 'package:movify/features/search/presentation/blocs/search_events.dart';
import 'package:movify/l10n/app_localizations.dart';

class SearchBarTextFiled extends HookWidget {
  const SearchBarTextFiled({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    void onChangedQuery(String query) {
      context.read<SearchBloc>().add(SearchQueryChanged(query));
    }

    final searchController = useSearchController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: SearchBar(
        backgroundColor: WidgetStateProperty.all(
          Theme.of(context).colorScheme.primary,
        ),
        onChanged: onChangedQuery,

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
