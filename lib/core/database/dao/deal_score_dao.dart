// ***************************************************************************
//
// TarotScore V2
//
// Fichier : deal_score_dao.dart
//
// Description : Accès SQLite à la table des scores des donnes.
//
// Auteur : David
//
// ***************************************************************************

import 'base_dao.dart';
import '../tables/deal_score_table.dart';

class DealScoreDao extends BaseDao {
  DealScoreDao._();

  static final DealScoreDao instance =
      DealScoreDao._();

  //--------------------------------------------------------------------------
  // Insertion
  //--------------------------------------------------------------------------

  Future<int> insert(
    Map<String, dynamic> values,
  ) async {
    final database = await db;

    return database.insert(
      DealScoreTable.tableName,
      values,
    );
  }

  //--------------------------------------------------------------------------
  // Scores d'une donne
  //--------------------------------------------------------------------------

  Future<List<Map<String, dynamic>>> getByDeal(
    String dealUuid,
  ) async {
    final database = await db;

    return database.query(
      DealScoreTable.tableName,
      where:
          '${DealScoreTable.dealUuid} = ?',
      whereArgs: [dealUuid],
      orderBy:
          DealScoreTable.playerPosition,
    );
  }

  //--------------------------------------------------------------------------
  // Suppression des scores d'une donne
  //--------------------------------------------------------------------------

  Future<int> deleteByDeal(
    String dealUuid,
  ) async {
    final database = await db;

    return database.delete(
      DealScoreTable.tableName,
      where:
          '${DealScoreTable.dealUuid} = ?',
      whereArgs: [dealUuid],
    );
  }

  //--------------------------------------------------------------------------
  // Suppression complète
  //--------------------------------------------------------------------------

  Future<int> deleteAll() async {
    final database = await db;

    return database.delete(
      DealScoreTable.tableName,
    );
  }
}