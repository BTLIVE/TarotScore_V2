// ***************************************************************************
//
// TarotScore V2
//
// Fichier : session_player_dao.dart
//
// Description : Accès SQLite à la table des joueurs d'une session.
//
// Auteur : David
//
// ***************************************************************************

import 'base_dao.dart';
import '../tables/session_player_table.dart';

class SessionPlayerDao extends BaseDao {
  SessionPlayerDao._();

  static final SessionPlayerDao instance =
      SessionPlayerDao._();

  //--------------------------------------------------------------------------
  // Insertion
  //--------------------------------------------------------------------------

  Future<int> insert(
    Map<String, dynamic> values,
  ) async {
    final database = await db;

    return database.insert(
      SessionPlayerTable.tableName,
      values,
    );
  }

  //--------------------------------------------------------------------------
  // Liste des joueurs d'une session
  //--------------------------------------------------------------------------

  Future<List<Map<String, dynamic>>> getBySession(
    String sessionUuid,
  ) async {
    final database = await db;

    return database.query(
      SessionPlayerTable.tableName,
      where:
          '${SessionPlayerTable.sessionUuid} = ?',
      whereArgs: [sessionUuid],
      orderBy:
          SessionPlayerTable.playerPosition,
    );
  }

  //--------------------------------------------------------------------------
  // Suppression des joueurs d'une session
  //--------------------------------------------------------------------------

  Future<int> deleteBySession(
    String sessionUuid,
  ) async {
    final database = await db;

    return database.delete(
      SessionPlayerTable.tableName,
      where:
          '${SessionPlayerTable.sessionUuid} = ?',
      whereArgs: [sessionUuid],
    );
  }

  //--------------------------------------------------------------------------
  // Suppression complète
  //--------------------------------------------------------------------------

  Future<int> deleteAll() async {
    final database = await db;

    return database.delete(
      SessionPlayerTable.tableName,
    );
  }
}