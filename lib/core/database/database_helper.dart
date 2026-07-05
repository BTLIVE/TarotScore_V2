import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'tables/player_table.dart';

class DatabaseHelper {
  DatabaseHelper._();

  static final DatabaseHelper instance = DatabaseHelper._();

  static Database? _database;

  static const String databaseName = 'tarot_score.db';
  static const int databaseVersion = 1;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();

    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasesPath = await getDatabasesPath();

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

  Future<void> _onCreate(
    Database db,
    int version,
  ) async {
    await PlayerTable.create(db);
  }

  Future<void> _onUpgrade(
    Database db,
    int oldVersion,
    int newVersion,
  ) async {
    // Les migrations seront ajoutées ici.
  }

  Future<void> close() async {
    final db = await database;
    db.close();
  }
}