import 'package:flutter/material.dart';
import 'build_animated_list_item.dart';

enum ButtonAnimationType {
  // Entrance animations
  slideUp,
  slideDown,
  slideLeft,
  slideRight,
  fade,
  scale,
  bounce,

  // Press animations
  press,
  ripple,
  pulse,
}

class AnimatedButton extends StatefulWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final ButtonAnimationType? entranceAnimation;
  final ButtonAnimationType? pressAnimation;
  final Duration animationDuration;
  final Duration entranceDelay;
  final bool autoAnimate;
  final Curve curve;

  const AnimatedButton({
    super.key,
    required this.child,
    this.onPressed,
    this.entranceAnimation,
    this.pressAnimation = ButtonAnimationType.press,
    this.animationDuration = const Duration(milliseconds: 600),
    this.entranceDelay = Duration.zero,
    this.autoAnimate = true,
    this.curve = Curves.easeOutCubic,
  });

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with TickerProviderStateMixin {
  late AnimationController _entranceController;
  late AnimationController _pressController;

  @override
  void initState() {
    super.initState();

    _entranceController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    _pressController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    if (widget.autoAnimate && widget.entranceAnimation != null) {
      Future.delayed(widget.entranceDelay, () {
        if (mounted) _entranceController.forward();
      });
    } else if (widget.entranceAnimation == null) {
      _entranceController.value = 1.0; // Skip entrance animation
    }
  }

  @override
  void dispose() {
    _entranceController.dispose();
    _pressController.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    if (widget.pressAnimation != null) {
      _pressController.forward();
    }
  }

  void _handleTapUp(TapUpDetails details) {
    if (widget.pressAnimation != null) {
      _pressController.reverse();
    }
    widget.onPressed?.call();
  }

  void _handleTapCancel() {
    if (widget.pressAnimation != null) {
      _pressController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget button = GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: _buildPressAnimation(),
    );

    // Add entrance animation if specified
    if (widget.entranceAnimation != null) {
      button = _buildEntranceAnimation(button);
    }

    return button;
  }

  Widget _buildPressAnimation() {
    if (widget.pressAnimation == null) {
      return widget.child;
    }

    return AnimatedBuilder(
      animation: _pressController,
      builder: (context, child) {
        return switch (widget.pressAnimation!) {
          ButtonAnimationType.press => Transform.scale(
            scale: 1.0 - (_pressController.value * 0.05),
            child: widget.child,
          ),
          ButtonAnimationType.pulse => Transform.scale(
            scale: 1.0 + (_pressController.value * 0.1),
            child: widget.child,
          ),
          ButtonAnimationType.ripple => Container(
            color: Colors.red.withValues(green: _pressController.value * 0.3),
            child: widget.child,
          ),
          _ => widget.child,
        };
      },
    );
  }

  Widget _buildEntranceAnimation(Widget child) {
    // Reuse your existing BuildAnimatedListItem for entrance animations
    final animationType = switch (widget.entranceAnimation!) {
      ButtonAnimationType.slideUp => ListItemAnimationType.slideFromBottom,
      ButtonAnimationType.slideDown => ListItemAnimationType.slideFromTop,
      ButtonAnimationType.slideLeft => ListItemAnimationType.slideFromRight,
      ButtonAnimationType.slideRight => ListItemAnimationType.slideFromLeft,
      ButtonAnimationType.fade => ListItemAnimationType.fade,
      ButtonAnimationType.scale => ListItemAnimationType.scale,
      ButtonAnimationType.bounce =>
        ListItemAnimationType
            .scale, // You can add bounce to BuildAnimatedListItem
      _ => ListItemAnimationType.fade,
    };

    return BuildAnimatedListItem(
      animation: _entranceController,
      index: 0,
      animationType: animationType,
      curve: widget.curve,
      child: child,
    );
  }

  void animate() => _entranceController.forward();
  void reverse() => _entranceController.reverse();
  void reset() => _entranceController.reset();
}
