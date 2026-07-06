import 'package:flutter/material.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
          children: const [
            SizedBox(height: AppSpacing.md),

            Text(
              'Bienvenue',
              style: AppTextStyles.title,
              textAlign: TextAlign.center,
            ),

            SizedBox(height: AppSpacing.xl),

            _HomeButton(
              icon: Icons.play_arrow,
              title: 'Nouvelle partie',
            ),

            SizedBox(height: AppSpacing.md),

            _HomeButton(
              icon: Icons.people,
              title: 'Joueurs',
            ),

            SizedBox(height: AppSpacing.md),

            _HomeButton(
              icon: Icons.history,
              title: 'Historique',
            ),

            SizedBox(height: AppSpacing.md),

            _HomeButton(
              icon: Icons.settings,
              title: 'Paramètres',
            ),

            Spacer(),

            Text(
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

  const _HomeButton({
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: () {},
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