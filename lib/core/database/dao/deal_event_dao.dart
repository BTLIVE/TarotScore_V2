// ***************************************************************************
//
// TarotScore V2
//
// Fichier : deal_event_dao.dart
//
// Description : Accès SQLite à la table des événements d'une donne.
//
// Auteur : David
//
// ***************************************************************************

import 'base_dao.dart';
import '../tables/deal_event_table.dart';

class DealEventDao extends BaseDao {
  DealEventDao._();

  static final DealEventDao instance =
      DealEventDao._();

  //--------------------------------------------------------------------------
  // Insertion
  //--------------------------------------------------------------------------

  Future<int> insert(
    Map<String, dynamic> values,
  ) async {
    final database = await db;

    return database.insert(
      DealEventTable.tableName,
      values,
    );
  }

  //--------------------------------------------------------------------------
  // Evénements d'une donne
  //--------------------------------------------------------------------------

  Future<List<Map<String, dynamic>>> getByDeal(
    String dealUuid,
  ) async {
    final database = await db;

    return database.query(
      DealEventTable.tableName,
      where:
          '${DealEventTable.dealUuid} = ?',
      whereArgs: [dealUuid],
      orderBy:
          DealEventTable.eventId,
    );
  }

  //--------------------------------------------------------------------------
  // Suppression des événements d'une donne
  //--------------------------------------------------------------------------

  Future<int> deleteByDeal(
    String dealUuid,
  ) async {
    final database = await db;

    return database.delete(
      DealEventTable.tableName,
      where:
          '${DealEventTable.dealUuid} = ?',
      whereArgs: [dealUuid],
    );
  }

  //--------------------------------------------------------------------------
  // Suppression complète
  //--------------------------------------------------------------------------

  Future<int> deleteAll() async {
    final database = await db;

    return database.delete(
      DealEventTable.tableName,
    );
  }
}