import 'package:sqflite/sqflite.dart';

import '../../../../../core/database/database_helper.dart';
import '../../../../../core/database/tables/player_table.dart';
import '../../../domain/player.dart';

class PlayerRepository {
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  /// Retourne l'instance de la base.
  Future<Database> get _db async => await _databaseHelper.database;

  /// Ajoute un joueur.
  Future<int> insert(Player player) async {
    final db = await _db;

    return await db.insert(
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

  /// Recherche un joueur par son id.
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

  /// Met à jour un joueur.
  Future<int> update(Player player) async {
    final db = await _db;

    return await db.update(
      PlayerTable.tableName,
      player.toMap(),
      where: '${PlayerTable.id} = ?',
      whereArgs: [player.id],
    );
  }

  /// Désactive un joueur.
  Future<int> deactivate(int id) async {
    final db = await _db;

    return await db.update(
      PlayerTable.tableName,
      {
        PlayerTable.active: 0,
      },
      where: '${PlayerTable.id} = ?',
      whereArgs: [id],
    );
  }

  /// Supprime définitivement un joueur.
  Future<int> delete(int id) async {
    final db = await _db;

    return await db.delete(
      PlayerTable.tableName,
      where: '${PlayerTable.id} = ?',
      whereArgs: [id],
    );
  }
}