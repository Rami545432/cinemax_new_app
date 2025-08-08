// import 'package:flutter/material.dart';
// import 'package:cinemax_app_new/core/services/favorite_service.dart';
// import 'package:cinemax_app_new/core/utils/models/favorite_model.dart';

// class FavoriteButton extends StatefulWidget {
//   final int id;
//   final String title;
//   final String imageUrl;
//   final List<String> gener;
//   final String type;
//   final String userId;
//   final double? size;
//   final Color? color;

//   const FavoriteButton({
//     super.key,
//     required this.id,
//     required this.title,
//     required this.imageUrl,
//     required this.gener,
//     required this.type,
//     required this.userId,
//     this.size,
//     this.color,
//   });

//   @override
//   State<FavoriteButton> createState() => _FavoriteButtonState();
// }

// class _FavoriteButtonState extends State<FavoriteButton> {
//   final FavoriteService _favoriteService = FavoriteService();
//   bool _isFavorite = false;
//   bool _isLoading = false;

//   @override
//   void initState() {
//     super.initState();
//     _checkFavoriteStatus();
//   }

//   Future<void> _checkFavoriteStatus() async {
//     setState(() => _isLoading = true);
//     _isFavorite = _favoriteService.isInFavorites(widget.id, widget.type);
//     setState(() => _isLoading = false);
//   }

//   Future<void> _toggleFavorite() async {
//     if (_isLoading) return;

//     setState(() => _isLoading = true);

//     try {
//       if (_isFavorite) {
//         // Remove from favorites
//         final item = FavoriteModel(
//           id: widget.id,
//           title: widget.title,
//           imageUrl: widget.imageUrl,
//           gener: widget.gener,
//           type: widget.type,
//           date: DateTime.now().toString(),
//           userId: widget.userId,
//         );
//         await _favoriteService.removeFromFavorites(item);
//       } else {
//         // Add to favorites
//         final item = FavoriteModel(
//           id: widget.id,
//           title: widget.title,
//           imageUrl: widget.imageUrl,
//           gener: widget.gener,
//           type: widget.type,
//           date: DateTime.now().toString(),
//           userId: widget.userId,
//         );
//         await _favoriteService.addToFavorites(item, widget.userId);
//       }

//       setState(() {
//         _isFavorite = !_isFavorite;
//         _isLoading = false;
//       });
//     } catch (e) {
//       setState(() => _isLoading = false);
//       // Show error message
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(
//               'Failed to ${_isFavorite ? 'remove from' : 'add to'} favorites',
//             ),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       onPressed: _toggleFavorite,
//       icon: _isLoading
//           ? SizedBox(
//               width: widget.size ?? 24,
//               height: widget.size ?? 24,
//               child: const CircularProgressIndicator(strokeWidth: 2),
//             )
//           : Icon(
//               _isFavorite ? Icons.favorite : Icons.favorite_border,
//               color: _isFavorite ? (widget.color ?? Colors.red) : Colors.grey,
//               size: widget.size,
//             ),
//     );
//   }
// }
