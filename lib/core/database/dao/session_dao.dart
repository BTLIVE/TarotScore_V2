// ***************************************************************************
//
// TarotScore V2
//
// Fichier : session_dao.dart
//
// Description : Accès SQLite à la table des sessions.
//
// Auteur : David
//
// ***************************************************************************

import 'package:sqflite/sqflite.dart';

import 'base_dao.dart';
import '../tables/session_table.dart';

class SessionDao extends BaseDao {
  SessionDao._();

  static final SessionDao instance =
      SessionDao._();

  //--------------------------------------------------------------------------
  // Insertion
  //--------------------------------------------------------------------------

  Future<int> insert(
    Map<String, dynamic> values,
  ) async {
    final database = await db;

    return database.insert(
      SessionTable.tableName,
      values,
    );
  }

  //--------------------------------------------------------------------------
  // Mise à jour
  //--------------------------------------------------------------------------

  Future<int> update(
    String uuid,
    Map<String, dynamic> values,
  ) async {
    final database = await db;

    return database.update(
      SessionTable.tableName,
      values,
      where:
          '${SessionTable.uuid} = ?',
      whereArgs: [uuid],
    );
  }

  //--------------------------------------------------------------------------
  // Recherche par UUID
  //--------------------------------------------------------------------------

  Future<Map<String, dynamic>?> getByUuid(
    String uuid,
  ) async {
    final database = await db;

    final result = await database.query(
      SessionTable.tableName,
      where:
          '${SessionTable.uuid} = ?',
      whereArgs: [uuid],
      limit: 1,
    );

    if (result.isEmpty) {
      return null;
    }

    return result.first;
  }

  //--------------------------------------------------------------------------
  // Liste
  //--------------------------------------------------------------------------

  Future<List<Map<String, dynamic>>> getAll()
      async {
    final database = await db;

    return database.query(
      SessionTable.tableName,
      orderBy:
          '${SessionTable.startedAt} DESC',
    );
  }

  //--------------------------------------------------------------------------
  // Existence
  //--------------------------------------------------------------------------

  Future<bool> exists(
    String uuid,
  ) async {
    return await getByUuid(uuid) !=
        null;
  }

  //--------------------------------------------------------------------------
  // Suppression
  //--------------------------------------------------------------------------

  Future<int> delete(
    String uuid,
  ) async {
    final database = await db;

    return database.delete(
      SessionTable.tableName,
      where:
          '${SessionTable.uuid} = ?',
      whereArgs: [uuid],
    );
  }

  //--------------------------------------------------------------------------
  // Suppression complète
  //--------------------------------------------------------------------------

  Future<int> deleteAll() async {
    final database = await db;

    return database.delete(
      SessionTable.tableName,
    );
  }
}