import 'package:flutter/material.dart';

import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

import '../../../sessions/services/session_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() =>
      _HomePageState();
}

class _HomePageState
    extends State<HomePage> {
  bool _hasCurrentSession = false;

  @override
  void initState() {
    super.initState();

    _restoreCurrentSession();
  }

  //--------------------------------------------------------------------------
  // Restauration de la partie en cours
  //--------------------------------------------------------------------------

  Future<void> _restoreCurrentSession()
  async {
    final restored =
        await SessionService.instance
            .restoreCurrentSession();

    if (!mounted) {
      return;
    }

    setState(() {
      _hasCurrentSession =
          restored;
    });
  }

  //--------------------------------------------------------------------------
  // Fonctionnalités non disponibles
  //--------------------------------------------------------------------------

  void _notImplemented() {
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
        title: const Text(
          'TarotScore V2',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          AppSpacing.lg,
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: AppSpacing.md,
            ),

            const Text(
              'Bienvenue',
              style: AppTextStyles.title,
              textAlign:
                  TextAlign.center,
            ),

            const SizedBox(
              height: AppSpacing.xl,
            ),

            //----------------------------------------------------------------
            // Reprendre la partie
            //----------------------------------------------------------------

            if (_hasCurrentSession) ...[
              _HomeButton(
                icon: Icons.restore,
                title:
                    'Reprendre la partie',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes
                        .currentSession,
                  );
                },
              ),

              const SizedBox(
                height: AppSpacing.md,
              ),
            ],

            //----------------------------------------------------------------
            // Nouvelle partie
            //----------------------------------------------------------------

            _HomeButton(
              icon: Icons.play_arrow,
              title:
                  'Nouvelle partie',
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.newSession,
                );
              },
            ),

            const SizedBox(
              height: AppSpacing.md,
            ),

            //----------------------------------------------------------------
            // Joueurs
            //----------------------------------------------------------------

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

            const SizedBox(
              height: AppSpacing.md,
            ),

            //----------------------------------------------------------------
            // Historique
            //----------------------------------------------------------------

            _HomeButton(
              icon: Icons.history,
              title: 'Historique',
              onPressed:
                  _notImplemented,
            ),

            const SizedBox(
              height: AppSpacing.md,
            ),

            //----------------------------------------------------------------
            // Paramètres
            //----------------------------------------------------------------

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
              textAlign:
                  TextAlign.center,
              style:
                  AppTextStyles.caption,
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeButton
    extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onPressed;

  const _HomeButton({
    required this.icon,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return FilledButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Padding(
        padding:
            const EdgeInsets.symmetric(
          vertical: AppSpacing.md,
        ),
        child: Text(title),
      ),
    );
  }
}