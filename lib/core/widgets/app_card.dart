import 'package:flutter/material.dart';

import '../theme/app_spacing.dart';

class AppCard extends StatelessWidget {
  final Widget child;

  final EdgeInsetsGeometry? padding;

  final VoidCallback? onTap;

  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = Padding(
      padding: padding ??
          const EdgeInsets.all(
            AppSpacing.md,
          ),
      child: child,
    );

    if (onTap != null) {
      content = InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: content,
      );
    }

    return Card(
      clipBehavior: Clip.antiAlias,
      child: content,
    );
  }
}