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

import 'dart:async';

import 'package:uuid/uuid.dart';

import '../../players/models/player.dart';
import '../../rules/models/rule_profile.dart';

import '../models/player_score.dart';
import '../models/session.dart';
import '../models/session_state.dart';

import '../repositories/current_session_repository.dart';
import '../repositories/session_repository.dart';

class SessionService {
  SessionService._();

  static final SessionService instance =
      SessionService._();

  static const Uuid _uuid = Uuid();

  static final SessionRepository
      _repository =
      SessionRepository.instance;

  static final CurrentSessionRepository
      _currentRepository =
      CurrentSessionRepository.instance;

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

      startedAt: DateTime.now(),

      finishedAt: null,

      ruleProfile: ruleProfile,

      players: List.unmodifiable(players),

      firstDealerPosition:
          firstDealerPosition,
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
      firstDealerPosition:
          firstDealerPosition,
    );

    final playerScores = List.generate(
      players.length,
      (index) => PlayerScore(
        playerPosition: index,
      ),
      growable: false,
    );

    //----------------------------------------------------------------------
    // Calcul des joueurs morts
    //----------------------------------------------------------------------

    final List<int> deadPlayerPositions;

    switch (players.length) {
      case 6:
        deadPlayerPositions = [
          firstDealerPosition,
        ];
        break;

      case 7:
        deadPlayerPositions = [
          (firstDealerPosition -
                  1 +
                  players.length) %
              players.length,
          firstDealerPosition,
        ];
        break;

      default:
        deadPlayerPositions = const [];
    }

    //----------------------------------------------------------------------
    // Calcul des joueurs actifs
    //----------------------------------------------------------------------

    final activePlayerPositions =
        List.generate(
      players.length,
      (index) => index,
    )
            .where(
              (index) =>
                  !deadPlayerPositions
                      .contains(index),
            )
            .toList(
              growable: false,
            );

    _currentSession = SessionState(
      session: session,
      playerScores: playerScores,
      activePlayerPositions:
          activePlayerPositions,
      deadPlayerPositions:
          deadPlayerPositions,
      nextDealNumber: 1,
      nextDealerPosition:
          firstDealerPosition,
    );

    unawaited(
      _currentRepository.save(
        _currentSession!,
      ),
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

    unawaited(
      _currentRepository.save(
        state,
      ),
    );
  }

  /// Ferme la session en cours.
  void closeCurrentSession() {
    _currentSession = null;

    unawaited(
      _currentRepository.delete(),
    );
  }

  //--------------------------------------------------------------------------
  // Persistance
  //--------------------------------------------------------------------------

  /// Sauvegarde la session courante
  /// dans les archives SQLite.
  Future<void> saveCurrentSession() async {
    final state = requireCurrentSession();

    await _repository.save(
      state.session,
    );

    await _repository.savePlayerScores(
      sessionUuid:
          state.session.uuid,
      players:
          state.session.players,
      playerScores:
          state.playerScores,
    );
  }

  /// Archive puis ferme la session.
  Future<void>
      closeAndSaveCurrentSession() async {
    if (!hasCurrentSession) {
      return;
    }

    await saveCurrentSession();

    closeCurrentSession();
  }

  //--------------------------------------------------------------------------
  // Restauration
  //--------------------------------------------------------------------------

  /// Recharge la partie en cours depuis le fichier JSON.
  ///
  /// Retourne true si une partie a été restaurée.
  Future<bool> restoreCurrentSession() async {
    final state =
        await _currentRepository.load();

    if (state == null) {
      return false;
    }

    _currentSession = state;

    return true;
  }

  //--------------------------------------------------------------------------
  // Validation
  //--------------------------------------------------------------------------

  void _validatePlayers(
    List<Player> players,
  ) {
    if (players.length < 3 ||
        players.length > 7) {
      throw ArgumentError(
        'Une session doit comporter entre 3 et 7 joueurs.',
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