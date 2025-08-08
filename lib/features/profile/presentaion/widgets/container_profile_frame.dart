import 'package:flutter/material.dart';

class ContainerProfileFrame extends StatelessWidget {
  const ContainerProfileFrame({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: null,
      width: 327,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xff252836),
        ),
      ),
      child: child,
    );
  }
}
