import 'package:sqflite/sqflite.dart';

class PlayerTable {
  static const String tableName = 'players';

  static const String id = 'id';
  static const String uuid = 'uuid';
  static const String firstName = 'first_name';
  static const String lastName = 'last_name';
  static const String nickname = 'nickname';
  static const String email = 'email';
  static const String phone = 'phone';
  static const String avatar = 'avatar';
  static const String active = 'active';
  static const String createdAt = 'created_at';
  static const String updatedAt = 'updated_at';

  static Future<void> create(Database db) async {
    await db.execute('''
      CREATE TABLE $tableName (
        $id INTEGER PRIMARY KEY AUTOINCREMENT,
        $uuid TEXT NOT NULL UNIQUE,
        $firstName TEXT NOT NULL,
        $lastName TEXT NOT NULL,
        $nickname TEXT,
        $email TEXT,
        $phone TEXT,
        $avatar TEXT,
        $active INTEGER NOT NULL DEFAULT 1,
        $createdAt TEXT NOT NULL,
        $updatedAt TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE INDEX idx_player_name
      ON $tableName($lastName, $firstName)
    ''');

    await db.execute('''
      CREATE INDEX idx_player_active
      ON $tableName($active)
    ''');
  }
}