import 'package:flutter/material.dart';

class PulsingStatusDot extends StatefulWidget {
  final Color color;
  const PulsingStatusDot({required this.color, super.key});

  @override
  State<PulsingStatusDot> createState() => PulsingStatusDotState();
}

class PulsingStatusDotState extends State<PulsingStatusDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
    _animation = Tween<double>(
      begin: 0.4,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => FadeTransition(
    opacity: _animation,
    child: Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: widget.color,
        // 2. The blur is now STATIC. Calculated once, completely free!
        boxShadow: [
          BoxShadow(
            color: widget.color.withValues(alpha: 0.6),
            blurRadius: 6,
            spreadRadius: 1,
          ),
        ],
      ),
    ),
  );
}
