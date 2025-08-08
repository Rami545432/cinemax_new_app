// import 'package:flutter/material.dart';

// class CustomFadingWidget extends StatefulWidget {
//   const CustomFadingWidget({super.key, required this.child});
//   final Widget child;

//   @override
//   State<CustomFadingWidget> createState() => _CustomFadingWidgetState();
// }

// class _CustomFadingWidgetState extends State<CustomFadingWidget>
//     with SingleTickerProviderStateMixin {
//   late AnimationController animationController;
//   late Animation animation;
//   @override
//   void initState() {
//     animation =
//         Tween<double>(begin: 0.2, end: 0.8).animate(animationController);
//     animationController = AnimationController(vsync: this);
//     super.initState();
//     animationController.addListener(() {
//       setState(() {});
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Opacity(
//       opacity: animation.value,
//       child: widget.child,
//     );
//   }
// }
