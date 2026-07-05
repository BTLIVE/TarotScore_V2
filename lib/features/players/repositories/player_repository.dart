import 'package:sqflite/sqflite.dart';

import '../../../core/database/database_helper.dart';
import '../../../core/database/tables/player_table.dart';
import '../models/player.dart';

class PlayerRepository {
  PlayerRepository._();

  static final PlayerRepository instance = PlayerRepository._();

  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  Future<Database> get _db async => await _databaseHelper.database;

  /// Ajoute un joueur.
  Future<int> insert(Player player) async {
    final db = await _db;

    return db.insert(
      PlayerTable.tableName,
      player.toMap(),
    );
  }

  /// Retourne tous les joueurs.
  Future<List<Player>> getAll() async {
    final db = await _db;

    final result = await db.query(
      PlayerTable.tableName,
      orderBy:
          '${PlayerTable.lastName}, ${PlayerTable.firstName}',
    );

    return result.map(Player.fromMap).toList();
  }

  /// Retourne uniquement les joueurs actifs.
  Future<List<Player>> getActive() async {
    final db = await _db;

    final result = await db.query(
      PlayerTable.tableName,
      where: '${PlayerTable.active} = ?',
      whereArgs: [1],
      orderBy:
          '${PlayerTable.lastName}, ${PlayerTable.firstName}',
    );

    return result.map(Player.fromMap).toList();
  }

  /// Recherche un joueur par son identifiant.
  Future<Player?> getById(int id) async {
    final db = await _db;

    final result = await db.query(
      PlayerTable.tableName,
      where: '${PlayerTable.id} = ?',
      whereArgs: [id],
      limit: 1,
    );

    if (result.isEmpty) {
      return null;
    }

    return Player.fromMap(result.first);
  }

  /// Recherche un joueur par son UUID.
  Future<Player?> getByUuid(String uuid) async {
    final db = await _db;

    final result = await db.query(
      PlayerTable.tableName,
      where: '${PlayerTable.uuid} = ?',
      whereArgs: [uuid],
      limit: 1,
    );

    if (result.isEmpty) {
      return null;
    }

    return Player.fromMap(result.first);
  }

  /// Met à jour un joueur.
  Future<int> update(Player player) async {
    final db = await _db;

    return db.update(
      PlayerTable.tableName,
      player.toMap(),
      where: '${PlayerTable.id} = ?',
      whereArgs: [player.id],
    );
  }

  /// Active ou désactive un joueur.
  Future<int> setActive(
    int id,
    bool active,
  ) async {
    final db = await _db;

    return db.update(
      PlayerTable.tableName,
      {
        PlayerTable.active: active ? 1 : 0,
        PlayerTable.updatedAt: DateTime.now().toIso8601String(),
      },
      where: '${PlayerTable.id} = ?',
      whereArgs: [id],
    );
  }

  Future<int> deactivate(int id) => setActive(id, false);

  Future<int> reactivate(int id) => setActive(id, true);

  /// Supprime définitivement un joueur.
  Future<int> delete(int id) async {
    final db = await _db;

    return db.delete(
      PlayerTable.tableName,
      where: '${PlayerTable.id} = ?',
      whereArgs: [id],
    );
  }
}