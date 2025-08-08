import 'package:flutter/material.dart';

class SimpleAnimatedCard extends StatefulWidget {
  final Widget child;

  const SimpleAnimatedCard({super.key, required this.child});

  @override
  State<SimpleAnimatedCard> createState() => _SimpleAnimatedCardState();
}

class _SimpleAnimatedCardState extends State<SimpleAnimatedCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedScale(
        scale: _isPressed ? 0.95 : 1.0,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
        child: widget.child,
      ),
    );
  }
}

// Use it:
