// ***************************************************************************
//
// TarotScore V2
//
// Fichier : session_service.dart
//
// Description : Gestion des sessions.
//
// Auteur : David
//
// ***************************************************************************

import 'package:uuid/uuid.dart';

import '../../players/models/player.dart';
import '../../rules/models/rule_profile.dart';

import '../models/player_score.dart';
import '../models/session.dart';
import '../models/session_state.dart';

class SessionService {
  SessionService._();

  static final SessionService instance =
      SessionService._();

  static const Uuid _uuid = Uuid();

  //--------------------------------------------------------------------------
  // Session courante
  //--------------------------------------------------------------------------

  SessionState? _currentSession;

  /// Session actuellement ouverte.
  SessionState? get currentSession =>
      _currentSession;

  /// Indique si une session est en cours.
  bool get hasCurrentSession =>
      _currentSession != null;

  /// Retourne la session courante.
  ///
  /// Lance une exception si aucune session n'est ouverte.
  SessionState requireCurrentSession() {
    final session = _currentSession;

    if (session == null) {
      throw StateError(
        'Aucune session en cours.',
      );
    }

    return session;
  }

  //--------------------------------------------------------------------------
  // Création
  //--------------------------------------------------------------------------

  Session create({
    required RuleProfile ruleProfile,
    required List<Player> players,
    required int firstDealerPosition,
  }) {
    _validatePlayers(players);

    _validateFirstDealer(
      firstDealerPosition,
      players.length,
    );

    return Session(
      uuid: _uuid.v4(),
      ruleProfile: ruleProfile,
      players: List.unmodifiable(players),
      firstDealerPosition: firstDealerPosition,
    );
  }

  //--------------------------------------------------------------------------
  // Démarrage
  //--------------------------------------------------------------------------

  SessionState start({
    required RuleProfile ruleProfile,
    required List<Player> players,
    required int firstDealerPosition,
  }) {
    final session = create(
      ruleProfile: ruleProfile,
      players: players,
      firstDealerPosition: firstDealerPosition,
    );

    final playerScores = List.generate(
      players.length,
      (index) => PlayerScore(
        playerPosition: index,
      ),
    );

    _currentSession = SessionState(
      session: session,
      playerScores: playerScores,
      nextDealNumber: 1,
      nextDealerPosition: firstDealerPosition,
    );

    return _currentSession!;
  }

  //--------------------------------------------------------------------------
  // Mise à jour
  //--------------------------------------------------------------------------

  /// Remplace l'état courant de la session.
  void updateCurrentSession(
    SessionState state,
  ) {
    _currentSession = state;
  }

  /// Ferme la session en cours.
  void closeCurrentSession() {
    _currentSession = null;
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

  void _validateFirstDealer(
    int dealer,
    int playerCount,
  ) {
    if (dealer < 0 ||
        dealer >= playerCount) {
      throw ArgumentError(
        'Position du premier donneur invalide.',
      );
    }
  }
}