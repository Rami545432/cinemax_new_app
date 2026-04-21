import 'package:flutter/material.dart';

class FavoriteErrorWidget extends StatelessWidget {
  const FavoriteErrorWidget({super.key, required this.errorMessage});
  final String errorMessage;
  @override
  Widget build(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Icon(Icons.error_outline, color: Colors.red, size: 48),
      const SizedBox(height: 16),
      Text(
        errorMessage,
        style: const TextStyle(color: Colors.red),
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 16),
      // ElevatedButton(
      //   onPressed: () {
      //     context.read<FavoriteCubit>().loadAllFavorites();
      //   },
      //   child: const Text('Retry'),
      // ),
    ],
  );
}
