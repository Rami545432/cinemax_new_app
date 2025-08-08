// import 'package:flutter/material.dart';

// import '../smoth_indicator_card.dart';
// import 'horizental_film_card_bloc_builder.dart';

// class HorizontalFilmCard extends StatefulWidget {
//   const HorizontalFilmCard({super.key});

//   @override
//   State<HorizontalFilmCard> createState() => _HorizontalFilmCardState();
// }

// class _HorizontalFilmCardState extends State<HorizontalFilmCard> {
//   final PageController _pageController = PageController(viewportFraction: 0.9);
//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       spacing: 10,
//       children: [
//         HorizintalFilmCardBlocBuilder(pageController: _pageController),
//         SmothIndicatorHomeCards(pageController: _pageController),
//       ],
//     );
//   }
// }
