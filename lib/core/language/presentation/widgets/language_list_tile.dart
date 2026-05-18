import 'package:flutter/material.dart';
import 'package:movify/core/utils/app_colors.dart';
import 'package:movify/core/utils/app_styles.dart';

class LanguageListTile extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  final IconData icon;

  const LanguageListTile({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
    decoration: BoxDecoration(
      color: isSelected
          ? AppPrimaryColors.blueAccent.withValues(alpha: 0.1)
          : Colors.transparent,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: isSelected
            ? AppPrimaryColors.blueAccent.withValues(alpha: 0.4)
            : Colors.transparent,
      ),
    ),
    child: ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      onTap: onTap,
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected
              ? AppPrimaryColors.blueAccent.withValues(alpha: 0.2)
              : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.05),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 20,
          color: isSelected
              ? AppPrimaryColors.blueAccent
              : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
        ),
      ),
      title: Text(
        title,
        style: AppStyles.textStyle16(context).copyWith(
          color: isSelected
              ? AppPrimaryColors.blueAccent
              : Theme.of(context).colorScheme.onSurface,
          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
        ),
      ),
      trailing: isSelected
          ? Icon(Icons.check_circle_rounded, color: AppPrimaryColors.blueAccent)
          : const SizedBox.shrink(),
    ),
  );
}
