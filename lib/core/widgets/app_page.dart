import 'package:flutter/material.dart';

import '../theme/app_spacing.dart';

class AppPage extends StatelessWidget {
  final String title;

  final Widget child;

  final List<Widget>? actions;

  final FloatingActionButton? floatingActionButton;

  final bool showBackButton;

  const AppPage({
    super.key,
    required this.title,
    required this.child,
    this.actions,
    this.floatingActionButton,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: showBackButton,
        title: Text(title),
        actions: actions,
      ),
      floatingActionButton: floatingActionButton,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(
            AppSpacing.lg,
          ),
          child: child,
        ),
      ),
    );
  }
}