// lib/screens/home_screen.dart

import 'package:cinemax_app_new/core/theme/widgets/color_scheme_selector.dart';
import 'package:cinemax_app_new/core/theme/widgets/theme_mode_selector.dart';
import 'package:cinemax_app_new/core/theme/widgets/theme_toggle_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Demo'),
        actions: const [
          ThemeToggleButton(), // Quick toggle in AppBar
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // Color picker
            const ColorSchemeSelector(),

            const SizedBox(height: 30),

            // Theme mode selector
            const ThemeModeSelector(),

            const SizedBox(height: 30),

            // Sample content to show theme
            _SampleContent(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Theme applied!')));
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}

// Sample content widget
class _SampleContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Preview', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),

          // Card to show colors
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sample Card',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'This demonstrates how your theme looks with real content. '
                    'Notice how colors change based on your selection.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),

                  // Buttons
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Primary'),
                      ),
                      const SizedBox(width: 8),
                      OutlinedButton(
                        onPressed: () {},
                        child: const Text('Outlined'),
                      ),
                      const SizedBox(width: 8),
                      TextButton(onPressed: () {}, child: const Text('Text')),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // List items
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: const Icon(Icons.person, color: Colors.white),
            ),
            title: const Text('List Item'),
            subtitle: const Text('With current theme colors'),
            trailing: const Icon(Icons.chevron_right),
          ),

          ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: const Icon(Icons.star, color: Colors.white),
            ),
            title: const Text('Another Item'),
            subtitle: const Text('Secondary color example'),
            trailing: const Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }
}
