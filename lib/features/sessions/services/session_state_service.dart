// ***************************************************************************
//
// TarotScore V2
//
// Fichier : session_state_service.dart
//
// Description : Construction de l'état courant d'une session.
//
// Auteur : David
//
// ***************************************************************************

import '../../rules/engine/pipeline/deal_context.dart';
import '../../rules/engine/rule_engine.dart';

import '../models/player_score.dart';
import '../models/session.dart';
import '../models/session_state.dart';

import 'dealer_service.dart';

class SessionStateService {
  //--------------------------------------------------------------------------
  // Dépendances
  //--------------------------------------------------------------------------

  final RuleEngine ruleEngine;

  final DealerService dealerService;

  const SessionStateService({
    required this.ruleEngine,
    required this.dealerService,
  });

  //--------------------------------------------------------------------------
  // Construction
  //--------------------------------------------------------------------------

  SessionState createState({
    required Session session,
  }) {
    final nextDealerPosition =
        dealerService.currentDealer(session);

    final deadPlayerPositions =
        _deadPlayers(
      session,
      nextDealerPosition,
    );

    final activePlayerPositions =
        _activePlayers(
      session,
      deadPlayerPositions,
    );

    return SessionState(
      session: session,

      playerScores: _computeScores(
        session,
      ),

      activePlayerPositions:
          activePlayerPositions,

      deadPlayerPositions:
          deadPlayerPositions,

      nextDealNumber:
          session.deals.length + 1,

      nextDealerPosition:
          nextDealerPosition,
    );
  }

  //--------------------------------------------------------------------------
  // Calcul des scores
  //--------------------------------------------------------------------------

  List<PlayerScore> _computeScores(
    Session session,
  ) {
    final scores = List.generate(
      session.playerCount,
      (index) => PlayerScore(
        playerPosition: index,
      ),
      growable: false,
    );

    for (final deal in session.deals) {
      //----------------------------------------------------------------------
      // Contexte de la donne
      //----------------------------------------------------------------------

      final dealerPosition =
          (session.firstDealerPosition +
                  deal.number -
                  1) %
              session.playerCount;

      final deadPlayerPositions =
          _deadPlayers(
        session,
        dealerPosition,
      );

      final activePlayerPositions =
          _activePlayers(
        session,
        deadPlayerPositions,
      );

      final context = DealContext(
        activePlayerPositions:
            activePlayerPositions,
        deadPlayerPositions:
            deadPlayerPositions,
        dealerPosition:
            dealerPosition,
      );

      //----------------------------------------------------------------------
      // Calcul
      //----------------------------------------------------------------------

      final calculation =
          ruleEngine.calculate(
        profile: session.ruleProfile,
        context: context,
        deal: deal,
      );

      final dealScores =
          calculation.playerScores;

      if (dealScores == null) {
        throw StateError(
          'Le RuleEngine n\'a produit aucun score.',
        );
      }

      //----------------------------------------------------------------------
      // Cumul
      //----------------------------------------------------------------------

      for (final entry
          in dealScores.entries) {
        final current =
            scores[entry.key];

        scores[entry.key] =
            current.copyWith(
          totalScore:
              current.totalScore +
                  entry.value,
        );
      }
    }

    return List.unmodifiable(scores);
  }

  //--------------------------------------------------------------------------
  // Joueurs morts
  //--------------------------------------------------------------------------

  List<int> _deadPlayers(
    Session session,
    int dealerPosition,
  ) {
    switch (session.playerCount) {
      case 6:
        return [
          dealerPosition,
        ];

      case 7:
        return [
          (dealerPosition -
                      1 +
                      session.playerCount) %
                  session.playerCount,
          dealerPosition,
        ];

      default:
        return const [];
    }
  }

  //--------------------------------------------------------------------------
  // Joueurs actifs
  //--------------------------------------------------------------------------

  List<int> _activePlayers(
    Session session,
    List<int> deadPlayers,
  ) {
    return List.generate(
      session.playerCount,
      (index) => index,
    )
        .where(
          (index) =>
              !deadPlayers.contains(index),
        )
        .toList(growable: false);
  }
}