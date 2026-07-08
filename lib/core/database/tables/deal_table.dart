// ***************************************************************************
//
// TarotScore V2
//
// Fichier : deal_table.dart
//
// Description : Table des donnes.
//
// Auteur : David
//
// ***************************************************************************

import 'package:sqflite/sqflite.dart';

class DealTable {
  DealTable._();

  //--------------------------------------------------------------------------
  // Table
  //--------------------------------------------------------------------------

  static const tableName = 'deals';

  //--------------------------------------------------------------------------
  // Colonnes
  //--------------------------------------------------------------------------

  /// Clé technique SQLite.
  static const id = 'id';

  /// UUID métier.
  static const uuid = 'uuid';

  /// Session propriétaire.
  static const sessionUuid = 'session_uuid';

  /// Numéro de la donne.
  static const number = 'number';

  /// Position du donneur.
  static const dealerPosition =
      'dealer_position';

  /// Position du preneur.
  static const attackerPosition =
      'attacker_position';

  /// Position du partenaire (nullable).
  static const partnerPosition =
      'partner_position';

  /// Contrat joué.
  static const contractId =
      'contract_id';

  /// Nombre de bouts.
  static const oudlers =
      'oudlers';

  /// Points réalisés.
  static const points =
      'points';

  //--------------------------------------------------------------------------
  // Création
  //--------------------------------------------------------------------------

  static Future<void> create(
    Database db,
  ) async {
    await db.execute('''
CREATE TABLE $tableName (

$id INTEGER PRIMARY KEY AUTOINCREMENT,

$uuid TEXT NOT NULL UNIQUE,

$sessionUuid TEXT NOT NULL,

$number INTEGER NOT NULL,

$dealerPosition INTEGER NOT NULL,

$attackerPosition INTEGER NOT NULL,

$partnerPosition INTEGER,

$contractId TEXT NOT NULL,

$oudlers INTEGER NOT NULL,

$points REAL NOT NULL

)
''');

    //----------------------------------------------------------------------
    // Index
    //----------------------------------------------------------------------

    await db.execute('''
CREATE INDEX idx_deals_session
ON $tableName($sessionUuid)
''');

    await db.execute('''
CREATE UNIQUE INDEX idx_deals_number
ON $tableName(
    $sessionUuid,
    $number
)
''');
  }
}