import 'package:flutter/material.dart';
import '../rating.dart';

class VerticalFilmCardLoading extends StatelessWidget {
  const VerticalFilmCardLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: .5,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.shade800),
        child: Rating(
          rating: 4.5,
        ),
      ),
    );
  }
}
