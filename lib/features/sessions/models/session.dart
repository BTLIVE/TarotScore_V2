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
    required this.ruleProfile,
    required this.players,
    this.deals = const [],
  });

  //--------------------------------------------------------------------------
  // Getters métier
  //--------------------------------------------------------------------------

  /// Nombre de joueurs.
  int get playerCount => players.length;

  bool get isThreePlayers => playerCount == 3;

  bool get isFourPlayers => playerCount == 4;

  bool get isFivePlayers => playerCount == 5;

  bool get hasDeals => deals.isNotEmpty;

  Deal? get lastDeal => hasDeals ? deals.last : null;

  //--------------------------------------------------------------------------
  // Copy
  //--------------------------------------------------------------------------

  Session copyWith({
    String? uuid,
    RuleProfile? ruleProfile,
    List<Player>? players,
    List<Deal>? deals,
  }) {
    return Session(
      uuid: uuid ?? this.uuid,
      ruleProfile: ruleProfile ?? this.ruleProfile,
      players: players ?? this.players,
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
        'deals: ${deals.length}'
        ')';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Session &&
            other.uuid == uuid &&
            other.ruleProfile == ruleProfile;
  }

  @override
  int get hashCode => Object.hash(
        uuid,
        ruleProfile,
      );
}