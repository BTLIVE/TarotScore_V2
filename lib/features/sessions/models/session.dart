// ***************************************************************************
// TarotScore V2
//
// Fichier : session.dart
//
// Description : Représente une session de Tarot.
//
// Une session contient les joueurs, les manches jouées
// et le profil de règles utilisé.
//
// Auteur : David
// ***************************************************************************

import '../../players/models/player.dart';
import '../../rules/models/rule_profile.dart';
import 'deal.dart';

class Session {
  //--------------------------------------------------------------------------
  // Identification
  //--------------------------------------------------------------------------

  /// Identifiant unique permanent.
  final String uuid;

  /// Date de création de la session.
  final DateTime startedAt;

  /// Date de fin de la session.
  ///
  /// Null tant que la partie est en cours.
  final DateTime? finishedAt;

  //--------------------------------------------------------------------------
  // Règles
  //--------------------------------------------------------------------------

  /// Profil de règles utilisé.
  final RuleProfile ruleProfile;

  //--------------------------------------------------------------------------
  // Participants
  //--------------------------------------------------------------------------

  /// Joueurs participant à la session.
  final List<Player> players;

  /// Position du premier donneur.
  final int firstDealerPosition;

  //--------------------------------------------------------------------------
  // Manches
  //--------------------------------------------------------------------------

  /// Historique des manches.
  final List<Deal> deals;

  //--------------------------------------------------------------------------
  // Constructeur
  //--------------------------------------------------------------------------

  const Session({
    required this.uuid,
    required this.startedAt,
    this.finishedAt,
    required this.ruleProfile,
    required this.players,
    required this.firstDealerPosition,
    this.deals = const [],
  });

  //--------------------------------------------------------------------------
  // Getters métier
  //--------------------------------------------------------------------------

  int get playerCount => players.length;

  bool get isThreePlayers => playerCount == 3;

  bool get isFourPlayers => playerCount == 4;

  bool get isFivePlayers => playerCount == 5;

  bool get hasDeals => deals.isNotEmpty;

  Deal? get lastDeal => hasDeals ? deals.last : null;

  /// Partie terminée.
  bool get isFinished => finishedAt != null;

  /// Partie en cours.
  bool get isInProgress => !isFinished;

  //--------------------------------------------------------------------------
  // Copy
  //--------------------------------------------------------------------------

  Session copyWith({
    String? uuid,
    DateTime? startedAt,
    DateTime? finishedAt,
    RuleProfile? ruleProfile,
    List<Player>? players,
    int? firstDealerPosition,
    List<Deal>? deals,
  }) {
    return Session(
      uuid: uuid ?? this.uuid,
      startedAt: startedAt ?? this.startedAt,
      finishedAt: finishedAt ?? this.finishedAt,
      ruleProfile: ruleProfile ?? this.ruleProfile,
      players: players ?? this.players,
      firstDealerPosition:
          firstDealerPosition ??
              this.firstDealerPosition,
      deals: deals ?? this.deals,
    );
  }

  //--------------------------------------------------------------------------
  // Divers
  //--------------------------------------------------------------------------

  @override
  String toString() {
    return 'Session('
        'players: ${players.length}, '
        'dealer: $firstDealerPosition, '
        'deals: ${deals.length}'
        ')';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Session &&
            other.uuid == uuid &&
            other.startedAt == startedAt &&
            other.finishedAt == finishedAt &&
            other.ruleProfile == ruleProfile &&
            other.firstDealerPosition ==
                firstDealerPosition;
  }

  @override
  int get hashCode => Object.hash(
        uuid,
        startedAt,
        finishedAt,
        ruleProfile,
        firstDealerPosition,
      );
}