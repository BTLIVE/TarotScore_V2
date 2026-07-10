// ***************************************************************************
//
// TarotScore V2
//
// Fichier : current_session_page.dart
//
// Description : Partie en cours.
//
// Auteur : David
//
// ***************************************************************************

import 'package:flutter/material.dart';

import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/app_page.dart';

import '../../services/session_service.dart';

import '../widgets/session_deals_card.dart';
import '../widgets/session_score_card.dart';

import 'deal_form_page.dart';

class CurrentSessionPage extends StatefulWidget {
  const CurrentSessionPage({
    super.key,
  });

  @override
  State<CurrentSessionPage> createState() =>
      _CurrentSessionPageState();
}

class _CurrentSessionPageState
    extends State<CurrentSessionPage> {
  //--------------------------------------------------------------------------
  // Nouvelle donne
  //--------------------------------------------------------------------------

  Future<void> _addDeal() async {
    final created =
        await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (_) =>
            const DealFormPage(),
      ),
    );

    if (created == true && mounted) {
      setState(() {});
    }
  }

  //--------------------------------------------------------------------------
  // Retour à l'accueil
  //--------------------------------------------------------------------------

  void _backToHome() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.home,
      (route) => false,
    );
  }

  //--------------------------------------------------------------------------
  // Fin de partie
  //--------------------------------------------------------------------------

  Future<void> _finishSession() async {
    await SessionService.instance
        .closeAndSaveCurrentSession();

    if (!mounted) {
      return;
    }

    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.home,
      (route) => false,
    );
  }

  //--------------------------------------------------------------------------
  // UI
  //--------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final sessionService =
        SessionService.instance;

    if (!sessionService
        .hasCurrentSession) {
      return const AppPage(
        title: 'Partie en cours',
        child: Center(
          child: Text(
            'Aucune partie en cours.',
          ),
        ),
      );
    }

    final state =
        sessionService
            .requireCurrentSession();

    final session =
        state.session;

    return AppPage(
      title: 'Partie en cours',
      child: ListView(
        padding: const EdgeInsets.all(
          AppSpacing.lg,
        ),
        children: [
          //------------------------------------------------------------------
          // Informations générales
          //------------------------------------------------------------------

          AppCard(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  'Session',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium,
                ),
                const SizedBox(
                  height: AppSpacing.md,
                ),
                Text(
                  'Profil : ${session.ruleProfile.name}',
                ),
                Text(
                  'Participants : ${session.playerCount}',
                ),
                Text(
                  'Donne n°${state.nextDealNumber}',
                ),
                Text(
                  'Prochain donneur : '
                  '${session.players[state.nextDealerPosition].firstName}',
                ),
              ],
            ),
          ),

          const SizedBox(
            height: AppSpacing.lg,
          ),

          //------------------------------------------------------------------
          // Classement
          //------------------------------------------------------------------

          SessionScoreCard(
            session: session,
            playerScores:
                state.playerScores,
          ),

          const SizedBox(
            height: AppSpacing.lg,
          ),

          //------------------------------------------------------------------
          // Joueurs actifs
          //------------------------------------------------------------------

          AppCard(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  'Joueurs en jeu',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium,
                ),
                const SizedBox(
                  height: AppSpacing.md,
                ),
                ...state.activePlayers.map(
                  (player) => ListTile(
                    dense: true,
                    contentPadding:
                        EdgeInsets.zero,
                    leading:
                        const Icon(
                      Icons.person,
                    ),
                    title: Text(
                      '${player.firstName} ${player.lastName}',
                    ),
                  ),
                ),
              ],
            ),
          ),

          if (state
              .deadPlayers
              .isNotEmpty) ...[
            const SizedBox(
              height: AppSpacing.lg,
            ),

            //--------------------------------------------------------------
            // Joueurs en attente
            //--------------------------------------------------------------

            AppCard(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment
                        .start,
                children: [
                  Text(
                    'En attente',
                    style: Theme.of(
                            context)
                        .textTheme
                        .titleMedium,
                  ),
                  const SizedBox(
                    height:
                        AppSpacing.md,
                  ),
                  ...state.deadPlayers.map(
                    (player) =>
                        ListTile(
                      dense: true,
                      contentPadding:
                          EdgeInsets
                              .zero,
                      leading:
                          const Icon(
                        Icons
                            .pause_circle,
                      ),
                      title: Text(
                        '${player.firstName} ${player.lastName}',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],

          const SizedBox(
            height: AppSpacing.lg,
          ),

          //------------------------------------------------------------------
          // Historique
          //------------------------------------------------------------------

          SessionDealsCard(
            deals: session.deals,
          ),

          const SizedBox(
            height: AppSpacing.xl,
          ),

          //------------------------------------------------------------------
          // Actions
          //------------------------------------------------------------------

          FilledButton.icon(
            onPressed: _addDeal,
            icon: const Icon(
              Icons.add,
            ),
            label: const Text(
              'Nouvelle donne',
            ),
          ),

          const SizedBox(
            height: AppSpacing.md,
          ),

          OutlinedButton.icon(
            onPressed: _backToHome,
            icon: const Icon(
              Icons.home,
            ),
            label: const Text(
              'Retour à l\'accueil',
            ),
          ),

          const SizedBox(
            height: AppSpacing.md,
          ),

          FilledButton.icon(
            onPressed: _finishSession,
            icon: const Icon(
              Icons.flag,
            ),
            label: const Text(
              'Terminer la partie',
            ),
          ),

          const SizedBox(
            height: AppSpacing.xxl,
          ),
        ],
      ),
    );
  }
}