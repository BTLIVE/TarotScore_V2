// ***************************************************************************
//
// TarotScore V2
//
// Fichier : deal_score_table.dart
//
// Description : Table des scores des donnes.
//
// Auteur : David
//
// ***************************************************************************

import 'package:sqflite/sqflite.dart';

class DealScoreTable {
  DealScoreTable._();

  //--------------------------------------------------------------------------
  // Table
  //--------------------------------------------------------------------------

  static const tableName =
      'deal_scores';

  //--------------------------------------------------------------------------
  // Colonnes
  //--------------------------------------------------------------------------

  /// Clé technique SQLite.
  static const id = 'id';

  /// UUID de la donne.
  static const dealUuid =
      'deal_uuid';

  /// Position du joueur dans la session.
  static const playerPosition =
      'player_position';

  /// Score obtenu pour cette donne.
  static const score =
      'score';

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

$playerPosition INTEGER NOT NULL,

$score INTEGER NOT NULL

)
''');

    //----------------------------------------------------------------------
    // Index
    //----------------------------------------------------------------------

    await db.execute('''
CREATE INDEX idx_deal_scores_deal
ON $tableName($dealUuid)
''');

    await db.execute('''
CREATE UNIQUE INDEX idx_deal_scores_unique
ON $tableName(
    $dealUuid,
    $playerPosition
)
''');
  }
}