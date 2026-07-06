import 'package:flutter/material.dart';

import '../theme/app_spacing.dart';

class AppButton extends StatelessWidget {
  final String label;

  final IconData? icon;

  final VoidCallback? onPressed;

  final bool expanded;

  const AppButton({
    super.key,
    required this.label,
    this.icon,
    this.onPressed,
    this.expanded = true,
  });

  @override
  Widget build(BuildContext context) {
    final button = FilledButton.icon(
      onPressed: onPressed,
      icon: icon != null
          ? Icon(icon)
          : const SizedBox.shrink(),
      label: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.md,
        ),
        child: Text(label),
      ),
    );

    if (!expanded) {
      return button;
    }

    return SizedBox(
      width: double.infinity,
      child: button,
    );
  }
}