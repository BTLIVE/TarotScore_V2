import 'package:flutter/material.dart';

import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _notImplemented(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Fonctionnalité en cours de développement',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TarotScore V2'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          AppSpacing.lg,
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: AppSpacing.md),

            const Text(
              'Bienvenue',
              style: AppTextStyles.title,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: AppSpacing.xl),

            _HomeButton(
              icon: Icons.play_arrow,
              title: 'Nouvelle partie',
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.newSession,
                );
              },
            ),

            const SizedBox(height: AppSpacing.md),

            _HomeButton(
              icon: Icons.people,
              title: 'Joueurs',
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.players,
                );
              },
            ),

            const SizedBox(height: AppSpacing.md),

            _HomeButton(
              icon: Icons.history,
              title: 'Historique',
              onPressed: () => _notImplemented(context),
            ),

            const SizedBox(height: AppSpacing.md),

            _HomeButton(
              icon: Icons.settings,
              title: 'Paramètres',
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.settings,
                );
              },
            ),

            const Spacer(),

            const Text(
              'Version 2.0',
              textAlign: TextAlign.center,
              style: AppTextStyles.caption,
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onPressed;

  const _HomeButton({
    required this.icon,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.md,
        ),
        child: Text(title),
      ),
    );
  }
}