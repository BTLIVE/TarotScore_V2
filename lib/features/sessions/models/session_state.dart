// ***************************************************************************
//
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
//
// ***************************************************************************

import '../../players/models/player.dart';

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
  // Joueurs actifs
  //--------------------------------------------------------------------------

  /// Positions des joueurs participant à la prochaine donne.
  final List<int> activePlayerPositions;

  /// Positions des joueurs "Morts".
  final List<int> deadPlayerPositions;

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
    this.activePlayerPositions = const [],
    this.deadPlayerPositions = const [],
    required this.nextDealNumber,
    required this.nextDealerPosition,
  });

  //--------------------------------------------------------------------------
  // Getters
  //--------------------------------------------------------------------------

  bool get hasDeals => session.deals.isNotEmpty;

  Deal? get lastDeal => session.lastDeal;

  /// Nombre de joueurs de la soirée.
  int get playerCount => session.playerCount;

  /// Nombre de joueurs actifs.
  int get activePlayerCount =>
      activePlayerPositions.length;

  /// Joueurs actifs.
  List<Player> get activePlayers {
    return activePlayerPositions
        .map(
          (position) =>
              session.players[position],
        )
        .toList(growable: false);
  }

  /// Joueurs morts.
  List<Player> get deadPlayers {
    return deadPlayerPositions
        .map(
          (position) =>
              session.players[position],
        )
        .toList(growable: false);
  }

  bool isActive(int position) {
    return activePlayerPositions.contains(
      position,
    );
  }

  bool isDead(int position) {
    return deadPlayerPositions.contains(
      position,
    );
  }

  //--------------------------------------------------------------------------
  // Copy
  //--------------------------------------------------------------------------

  SessionState copyWith({
    Session? session,
    List<PlayerScore>? playerScores,
    List<int>? activePlayerPositions,
    List<int>? deadPlayerPositions,
    int? nextDealNumber,
    int? nextDealerPosition,
  }) {
    return SessionState(
      session: session ?? this.session,
      playerScores:
          playerScores ?? this.playerScores,
      activePlayerPositions:
          activePlayerPositions ??
              this.activePlayerPositions,
      deadPlayerPositions:
          deadPlayerPositions ??
              this.deadPlayerPositions,
      nextDealNumber:
          nextDealNumber ??
              this.nextDealNumber,
      nextDealerPosition:
          nextDealerPosition ??
              this.nextDealerPosition,
    );
  }

  //--------------------------------------------------------------------------
  // Divers
  //--------------------------------------------------------------------------

  @override
  String toString() {
    return 'SessionState('
        'deal: $nextDealNumber, '
        'dealer: $nextDealerPosition, '
        'active: ${activePlayerPositions.length}, '
        'dead: ${deadPlayerPositions.length}'
        ')';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is SessionState &&
            other.session == session &&
            other.playerScores ==
                playerScores &&
            other.activePlayerPositions ==
                activePlayerPositions &&
            other.deadPlayerPositions ==
                deadPlayerPositions &&
            other.nextDealNumber ==
                nextDealNumber &&
            other.nextDealerPosition ==
                nextDealerPosition;
  }

  @override
  int get hashCode {
    return Object.hash(
      session,
      playerScores,
      activePlayerPositions,
      deadPlayerPositions,
      nextDealNumber,
      nextDealerPosition,
    );
  }
}