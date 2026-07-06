import 'package:flutter/material.dart';

import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';

class AppSection extends StatelessWidget {
  final String title;

  final Widget child;

  const AppSection({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: AppSpacing.lg,
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [

          Text(
            title,
            style: AppTextStyles.heading,
          ),

          const SizedBox(
            height: AppSpacing.md,
          ),

          child,
        ],
      ),
    );
  }
}