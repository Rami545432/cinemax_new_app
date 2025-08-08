import 'package:cinemax_app_new/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/bloc_provieders_views/search_provider.dart';

class SearchBarButton extends StatelessWidget {
  const SearchBarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SearchMultiProviders(),
            ),
          );
        },
        child: Container(
          height: 56,
          decoration: BoxDecoration(
            color: AppPrimaryColors.soft,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            children: [
              const SizedBox(width: 16),
              const Icon(Icons.search),
              const SizedBox(width: 12),
              Text(
                'Search for movies, series, etc',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
