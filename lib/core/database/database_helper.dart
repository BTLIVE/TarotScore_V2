// ***************************************************************************
//
// TarotScore V2
//
// Fichier : database_helper.dart
//
// Description : Gestion de la base SQLite.
//
// Auteur : David
//
// ***************************************************************************

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'tables/deal_event_table.dart';
import 'tables/deal_score_table.dart';
import 'tables/deal_table.dart';
import 'tables/player_table.dart';
import 'tables/session_player_table.dart';
import 'tables/session_table.dart';

class DatabaseHelper {
  DatabaseHelper._();

  static final DatabaseHelper instance =
      DatabaseHelper._();

  static Database? _database;

  static const String databaseName =
      'tarot_score.db';

  /// Version du schéma SQLite.
  static const int databaseVersion = 3;

  //--------------------------------------------------------------------------
  // Base de données
  //--------------------------------------------------------------------------

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database =
        await _initDatabase();

    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasesPath =
        await getDatabasesPath();

    final path = join(
      databasesPath,
      databaseName,
    );

    return openDatabase(
      path,
      version: databaseVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  //--------------------------------------------------------------------------
  // Création
  //--------------------------------------------------------------------------

  Future<void> _onCreate(
    Database db,
    int version,
  ) async {
    await PlayerTable.create(db);

    await SessionTable.create(db);

    await SessionPlayerTable.create(db);

    await DealTable.create(db);

    await DealScoreTable.create(db);

    await DealEventTable.create(db);
  }

  //--------------------------------------------------------------------------
  // Migration
  //--------------------------------------------------------------------------

  Future<void> _onUpgrade(
    Database db,
    int oldVersion,
    int newVersion,
  ) async {
    if (oldVersion < 3) {
      await SessionTable.create(db);

      await SessionPlayerTable.create(db);

      await DealTable.create(db);

      await DealScoreTable.create(db);

      await DealEventTable.create(db);
    }
  }

  //--------------------------------------------------------------------------
  // Fermeture
  //--------------------------------------------------------------------------

  Future<void> close() async {
    final db = await database;

    await db.close();

    _database = null;
  }
}