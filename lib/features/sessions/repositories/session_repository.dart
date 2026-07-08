// ***************************************************************************
//
// TarotScore V2
//
// Fichier : session_repository.dart
//
// Description : Repository des sessions.
//
// Auteur : David
//
// ***************************************************************************

import '../../../core/database/dao/deal_dao.dart';
import '../../../core/database/dao/session_dao.dart';
import '../../../core/database/dao/session_player_dao.dart';

import '../../../core/database/tables/deal_table.dart';
import '../../../core/database/tables/session_player_table.dart';
import '../../../core/database/tables/session_table.dart';

import '../../players/models/player.dart';

import '../models/player_score.dart';
import '../models/session.dart';

class SessionRepository {
  SessionRepository._();

  static final SessionRepository instance =
      SessionRepository._();

  //--------------------------------------------------------------------------
  // DAO
  //--------------------------------------------------------------------------

  final SessionDao _sessionDao =
      SessionDao.instance;

  final SessionPlayerDao _sessionPlayerDao =
      SessionPlayerDao.instance;

  final DealDao _dealDao =
      DealDao.instance;

  //--------------------------------------------------------------------------
  // Sauvegarde de la session
  //--------------------------------------------------------------------------

  Future<void> save(
    Session session,
  ) async {
    final values = {
      SessionTable.uuid:
          session.uuid,

      SessionTable.ruleProfileUuid:
          session.ruleProfile.uuid,

      SessionTable.startedAt:
          session.startedAt
              .toIso8601String(),

      SessionTable.finishedAt:
          session.finishedAt
              ?.toIso8601String(),

      SessionTable.status:
          session.isFinished ? 1 : 0,

      SessionTable.playerCount:
          session.playerCount,

      SessionTable.firstDealerPosition:
          session.firstDealerPosition,
    };

    if (await _sessionDao.exists(
      session.uuid,
    )) {
      await _sessionDao.update(
        session.uuid,
        values,
      );
    } else {
      await _sessionDao.insert(
        values,
      );
    }

    await _saveDeals(
      session,
    );
  }

  //--------------------------------------------------------------------------
  // Sauvegarde des scores finaux
  //--------------------------------------------------------------------------

  Future<void> savePlayerScores({
    required String sessionUuid,
    required List<Player> players,
    required List<PlayerScore> playerScores,
  }) async {
    await _sessionPlayerDao.deleteBySession(
      sessionUuid,
    );

    for (final score in playerScores) {
      final player =
          players[score.playerPosition];

      await _sessionPlayerDao.insert(
        {
          SessionPlayerTable.sessionUuid:
              sessionUuid,

          SessionPlayerTable.playerUuid:
              player.uuid,

          SessionPlayerTable.playerPosition:
              score.playerPosition,

          SessionPlayerTable.finalScore:
              score.totalScore,
        },
      );
    }
  }

  //--------------------------------------------------------------------------
  // Sauvegarde des donnes
  //--------------------------------------------------------------------------

  Future<void> _saveDeals(
    Session session,
  ) async {
    await _dealDao.deleteBySession(
      session.uuid,
    );

    for (final deal in session.deals) {

      final dealerPosition =
          (session.firstDealerPosition +
                  deal.number -
                  1) %
              session.playerCount;

      await _dealDao.insert(
        {
          DealTable.uuid:
              deal.uuid,

          DealTable.sessionUuid:
              session.uuid,

          DealTable.number:
              deal.number,

          DealTable.dealerPosition:
              dealerPosition,

          DealTable.attackerPosition:
              deal.attackerPosition,

          DealTable.partnerPosition:
              deal.partnerPosition,

          DealTable.contractId:
              deal.contractId,

          DealTable.oudlers:
              deal.oudlers,

          DealTable.points:
              deal.points,
        },
      );
    }
  }
    //--------------------------------------------------------------------------
  // Suppression
  //--------------------------------------------------------------------------

  Future<void> delete(
    String uuid,
  ) async {
    // Pour l'instant seule la session est supprimée.
    //
    // Les tables enfants (session_players, deals,
    // deal_scores et deal_events) seront gérées
    // lors du Sprint 8.4.
    await _sessionDao.delete(
      uuid,
    );
  }

  //--------------------------------------------------------------------------
  // Recherche
  //--------------------------------------------------------------------------

  Future<Session?> getByUuid(
    String uuid,
  ) async {
    // Chargement complet prévu au Sprint 8.5.
    throw UnimplementedError(
      'Chargement des sessions non implémenté.',
    );
  }

  //--------------------------------------------------------------------------

  Future<List<Session>> getAll()
      async {
    // Liste des parties prévue au Sprint 8.5.
    throw UnimplementedError(
      'Liste des sessions non implémentée.',
    );
  }
}