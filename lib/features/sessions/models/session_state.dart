// ***************************************************************************
// TarotScore V2
//
// Fichier : session_state.dart
//
// Description : Etat courant d'une session.
//
// Cette classe n'est jamais enregistrée en base.
// Elle est reconstruite après chaque calcul.
//
// Auteur : David
// ***************************************************************************

import 'deal.dart';
import 'player_score.dart';
import 'session.dart';

class SessionState {
  //--------------------------------------------------------------------------
  // Session
  //--------------------------------------------------------------------------

  /// Session en cours.
  final Session session;

  //--------------------------------------------------------------------------
  // Scores
  //--------------------------------------------------------------------------

  /// Scores cumulés des joueurs.
  final List<PlayerScore> playerScores;

  //--------------------------------------------------------------------------
  // Etat courant
  //--------------------------------------------------------------------------

  /// Numéro de la prochaine donne.
  final int nextDealNumber;

  /// Position du prochain donneur.
  final int nextDealerPosition;

  //--------------------------------------------------------------------------
  // Constructeur
  //--------------------------------------------------------------------------

  const SessionState({
    required this.session,
    required this.playerScores,
    required this.nextDealNumber,
    required this.nextDealerPosition,
  });

  //--------------------------------------------------------------------------
  // Getters
  //--------------------------------------------------------------------------

  bool get hasDeals => session.deals.isNotEmpty;

  Deal? get lastDeal => session.lastDeal;

  //--------------------------------------------------------------------------
  // Copy
  //--------------------------------------------------------------------------

  SessionState copyWith({
    Session? session,
    List<PlayerScore>? playerScores,
    int? nextDealNumber,
    int? nextDealerPosition,
  }) {
    return SessionState(
      session: session ?? this.session,
      playerScores: playerScores ?? this.playerScores,
      nextDealNumber: nextDealNumber ?? this.nextDealNumber,
      nextDealerPosition:
          nextDealerPosition ?? this.nextDealerPosition,
    );
  }

  //--------------------------------------------------------------------------
  // Divers
  //--------------------------------------------------------------------------

  @override
  String toString() {
    return 'SessionState('
        'deal: $nextDealNumber, '
        'dealer: $nextDealerPosition'
        ')';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is SessionState &&
            other.session == session &&
            other.playerScores == playerScores &&
            other.nextDealNumber == nextDealNumber &&
            other.nextDealerPosition ==
                nextDealerPosition;
  }

  @override
  int get hashCode => Object.hash(
        session,
        playerScores,
        nextDealNumber,
        nextDealerPosition,
      );
}