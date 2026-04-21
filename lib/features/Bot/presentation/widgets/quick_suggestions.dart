import 'package:flutter/material.dart';

class QuickSuggestions extends StatelessWidget {
  final ValueChanged<String> onSuggestionTap;

  const QuickSuggestions({super.key, required this.onSuggestionTap});

  static const List<Map<String, String>> _suggestions = [
    {'icon': '🎬', 'text': 'Surprise me!'},
    {'icon': '😊', 'text': 'Feel-good movies'},
    {'icon': '🔥', 'text': 'Trending now'},
    {'icon': '⭐', 'text': 'Top rated of 2025'},
    {'icon': '🎭', 'text': 'Best thrillers'},
    {'icon': '😂', 'text': 'Comedy picks'},
  ];

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(16),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Quick suggestions',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _suggestions
                .map(
                  (suggestion) => ActionChip(
                    avatar: Text(
                      suggestion['icon']!,
                      style: const TextStyle(fontSize: 16),
                    ),
                    label: Text(suggestion['text']!),
                    onPressed: () => onSuggestionTap(suggestion['text']!),
                    backgroundColor:
                        Theme.of(context).brightness == Brightness.dark
                        ? Colors.grey.shade800
                        : Colors.grey.shade100,
                    side: BorderSide.none,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    ),
  );
}
