// ***************************************************************************
//
// TarotScore V2
//
// Fichier : session_state_builder.dart
//
// Description : Construction de l'état courant d'une session.
//
// Auteur : David
//
// ***************************************************************************

import '../models/player_score.dart';
import '../models/session.dart';
import '../models/session_state.dart';

class SessionStateBuilder {
  SessionStateBuilder._();

  static final SessionStateBuilder instance =
      SessionStateBuilder._();

  //--------------------------------------------------------------------------
  // Construction
  //--------------------------------------------------------------------------

  SessionState build({
    required Session session,
  }) {
    final playerScores = List.generate(
      session.playerCount,
      (index) => PlayerScore(
        playerPosition: index,
      ),
    );

    final nextDealerPosition =
        _nextDealerPosition(session);

    final deadPlayerPositions =
        _calculateDeadPlayers(
      session,
      nextDealerPosition,
    );

    final activePlayerPositions =
        _calculateActivePlayers(
      session,
      deadPlayerPositions,
    );

    return SessionState(
      session: session,
      playerScores: playerScores,
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
  // Calcul du prochain donneur
  //--------------------------------------------------------------------------

  int _nextDealerPosition(
    Session session,
  ) {
    return (session.firstDealerPosition +
            session.deals.length) %
        session.playerCount;
  }

  //--------------------------------------------------------------------------
  // Calcul des morts
  //--------------------------------------------------------------------------

  List<int> _calculateDeadPlayers(
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
  // Calcul des joueurs actifs
  //--------------------------------------------------------------------------

  List<int> _calculateActivePlayers(
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