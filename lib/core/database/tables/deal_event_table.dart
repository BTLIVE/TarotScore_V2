// ***************************************************************************
//
// TarotScore V2
//
// Fichier : deal_event_table.dart
//
// Description : Table des événements d'une donne.
//
// Auteur : David
//
// ***************************************************************************

import 'package:sqflite/sqflite.dart';

class DealEventTable {
  DealEventTable._();

  //--------------------------------------------------------------------------
  // Table
  //--------------------------------------------------------------------------

  static const tableName =
      'deal_events';

  //--------------------------------------------------------------------------
  // Colonnes
  //--------------------------------------------------------------------------

  /// Clé technique SQLite.
  static const id = 'id';

  /// UUID de la donne.
  static const dealUuid =
      'deal_uuid';

  /// Identifiant de l'événement.
  static const eventId =
      'event_id';

  //--------------------------------------------------------------------------
  // Création
  //--------------------------------------------------------------------------

  static Future<void> create(
    Database db,
  ) async {
    await db.execute('''
CREATE TABLE $tableName (

$id INTEGER PRIMARY KEY AUTOINCREMENT,

$dealUuid TEXT NOT NULL,

$eventId TEXT NOT NULL

)
''');

    //----------------------------------------------------------------------
    // Index
    //----------------------------------------------------------------------

    await db.execute('''
CREATE INDEX idx_deal_events_deal
ON $tableName($dealUuid)
''');

    await db.execute('''
CREATE UNIQUE INDEX idx_deal_events_unique
ON $tableName(
    $dealUuid,
    $eventId
)
''');
  }
}