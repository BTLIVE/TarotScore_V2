// ***************************************************************************
// TarotScore V2
//
// Fichier : session_service.dart
//
// Description : Gestion des sessions.
//
// Auteur : David
// ***************************************************************************

import 'package:uuid/uuid.dart';

import '../../players/models/player.dart';
import '../../rules/models/rule_profile.dart';
import '../models/session.dart';

class SessionService {
  const SessionService();

  static const Uuid _uuid = Uuid();

  //--------------------------------------------------------------------------
  // Création
  //--------------------------------------------------------------------------

  Session create({
    required RuleProfile ruleProfile,
    required List<Player> players,
  }) {
    _validatePlayers(players);

    return Session(
      uuid: _uuid.v4(),
      ruleProfile: ruleProfile,
      players: List.unmodifiable(players),
    );
  }

  //--------------------------------------------------------------------------
  // Validation
  //--------------------------------------------------------------------------

  void _validatePlayers(
    List<Player> players,
  ) {
    if (players.length < 3 || players.length > 5) {
      throw ArgumentError(
        'Une session doit comporter entre 3 et 5 joueurs.',
      );
    }

    final uuids = players
        .map((player) => player.uuid)
        .toSet();

    if (uuids.length != players.length) {
      throw ArgumentError(
        'Un joueur est présent plusieurs fois.',
      );
    }
  }
}