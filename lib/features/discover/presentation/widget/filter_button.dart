import 'package:flutter/material.dart';
import 'package:movify/core/utils/app_styles.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
    required this.backgroundColor,
  });
  final VoidCallback onPressed;
  final IconData icon;
  final String label;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final style = AppStyles.textStyle16(context).copyWith(color: Colors.white);
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      label: Text(label, style: style),
      icon: Icon(icon, color: Colors.white),
    );
  }
}
