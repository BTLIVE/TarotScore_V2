// ***************************************************************************
// TarotScore V2
//
// Fichier : session_state_service.dart
//
// Description : Construction de l'état courant d'une session.
//
// Auteur : David
// ***************************************************************************

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
    return SessionState(
      session: session,
      playerScores: _computeScores(session),
      nextDealNumber: _nextDealNumber(session),
      nextDealerPosition:
          dealerService.currentDealer(session),
    );
  }

  //--------------------------------------------------------------------------
  // Calcul des scores
  //--------------------------------------------------------------------------

  List<PlayerScore> _computeScores(
    Session session,
  ) {
    var scores = List.generate(
      session.playerCount,
      (index) => PlayerScore(
        playerPosition: index,
      ),
      growable: false,
    );

    for (final deal in session.deals) {
      final calculation = ruleEngine.calculate(
        profile: session.ruleProfile,
        playerCount: session.playerCount,
        deal: deal,
      );

      final dealScores = calculation.playerScores!;

      scores = scores
          .map(
            (playerScore) => playerScore.copyWith(
              totalScore:
                  playerScore.totalScore +
                  (dealScores[playerScore.playerPosition] ?? 0),
            ),
          )
          .toList(growable: false);
    }

    return List.unmodifiable(scores);
  }

  //--------------------------------------------------------------------------
  // Prochaine donne
  //--------------------------------------------------------------------------

  int _nextDealNumber(
    Session session,
  ) {
    return session.deals.length + 1;
  }
}