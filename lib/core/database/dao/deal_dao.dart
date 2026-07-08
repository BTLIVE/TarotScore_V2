// ***************************************************************************
//
// TarotScore V2
//
// Fichier : deal_dao.dart
//
// Description : Accès SQLite à la table des donnes.
//
// Auteur : David
//
// ***************************************************************************

import 'base_dao.dart';
import '../tables/deal_table.dart';

class DealDao extends BaseDao {
  DealDao._();

  static final DealDao instance =
      DealDao._();

  //--------------------------------------------------------------------------
  // Insertion
  //--------------------------------------------------------------------------

  Future<int> insert(
    Map<String, dynamic> values,
  ) async {
    final database = await db;

    return database.insert(
      DealTable.tableName,
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
      DealTable.tableName,
      values,
      where:
          '${DealTable.uuid} = ?',
      whereArgs: [uuid],
    );
  }

  //--------------------------------------------------------------------------
  // Recherche
  //--------------------------------------------------------------------------

  Future<Map<String, dynamic>?> getByUuid(
    String uuid,
  ) async {
    final database = await db;

    final result = await database.query(
      DealTable.tableName,
      where:
          '${DealTable.uuid} = ?',
      whereArgs: [uuid],
      limit: 1,
    );

    if (result.isEmpty) {
      return null;
    }

    return result.first;
  }

  //--------------------------------------------------------------------------
  // Donnes d'une session
  //--------------------------------------------------------------------------

  Future<List<Map<String, dynamic>>> getBySession(
    String sessionUuid,
  ) async {
    final database = await db;

    return database.query(
      DealTable.tableName,
      where:
          '${DealTable.sessionUuid} = ?',
      whereArgs: [sessionUuid],
      orderBy: DealTable.number,
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
  // Suppression d'une donne
  //--------------------------------------------------------------------------

  Future<int> delete(
    String uuid,
  ) async {
    final database = await db;

    return database.delete(
      DealTable.tableName,
      where:
          '${DealTable.uuid} = ?',
      whereArgs: [uuid],
    );
  }

  //--------------------------------------------------------------------------
  // Suppression des donnes d'une session
  //--------------------------------------------------------------------------

  Future<int> deleteBySession(
    String sessionUuid,
  ) async {
    final database = await db;

    return database.delete(
      DealTable.tableName,
      where:
          '${DealTable.sessionUuid} = ?',
      whereArgs: [sessionUuid],
    );
  }

  //--------------------------------------------------------------------------
  // Suppression complète
  //--------------------------------------------------------------------------

  Future<int> deleteAll() async {
    final database = await db;

    return database.delete(
      DealTable.tableName,
    );
  }
}