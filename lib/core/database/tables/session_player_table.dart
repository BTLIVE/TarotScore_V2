// ***************************************************************************
//
// TarotScore V2
//
// Fichier : session_player_table.dart
//
// Description : Table des joueurs d'une session.
//
// Auteur : David
//
// ***************************************************************************

import 'package:sqflite/sqflite.dart';

class SessionPlayerTable {
  SessionPlayerTable._();

  //--------------------------------------------------------------------------
  // Table
  //--------------------------------------------------------------------------

  static const tableName = 'session_players';

  //--------------------------------------------------------------------------
  // Colonnes
  //--------------------------------------------------------------------------

  /// Clé technique SQLite.
  static const id = 'id';

  /// UUID de la session.
  static const sessionUuid = 'session_uuid';

  /// UUID du joueur.
  static const playerUuid = 'player_uuid';

  /// Position du joueur autour de la table.
  static const playerPosition =
      'player_position';

  /// Score final du joueur.
  ///
  /// Ce score est figé lors de la sauvegarde
  /// de la session et servira directement
  /// aux statistiques.
  static const finalScore =
      'final_score';

  //--------------------------------------------------------------------------
  // Création
  //--------------------------------------------------------------------------

  static Future<void> create(
    Database db,
  ) async {
    await db.execute('''
CREATE TABLE $tableName (

$id INTEGER PRIMARY KEY AUTOINCREMENT,

$sessionUuid TEXT NOT NULL,

$playerUuid TEXT NOT NULL,

$playerPosition INTEGER NOT NULL,

$finalScore INTEGER NOT NULL DEFAULT 0

)
''');

    //----------------------------------------------------------------------
    // Index
    //----------------------------------------------------------------------

    await db.execute('''
CREATE INDEX idx_session_players_session
ON $tableName($sessionUuid)
''');

    await db.execute('''
CREATE INDEX idx_session_players_player
ON $tableName($playerUuid)
''');

    await db.execute('''
CREATE UNIQUE INDEX idx_session_players_position
ON $tableName(
    $sessionUuid,
    $playerPosition
)
''');

    await db.execute('''
CREATE UNIQUE INDEX idx_session_players_player_unique
ON $tableName(
    $sessionUuid,
    $playerUuid
)
''');
  }
}