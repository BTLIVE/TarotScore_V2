import 'package:sqflite/sqflite.dart';

class PlayerTable {
  PlayerTable._();

  static const String tableName = 'players';

  // Colonnes
  static const String id = 'id';
  static const String uuid = 'uuid';

  // Informations générales
  static const String firstName = 'first_name';
  static const String lastName = 'last_name';
  static const String nickname = 'nickname';

  // Contact
  static const String email = 'email';
  static const String mobilePhone = 'mobile_phone';

  // Informations personnelles
  static const String birthDate = 'birth_date';
  static const String comments = 'comments';

  // Identité visuelle
  static const String avatarId = 'avatar_id';
  static const String photoFileName = 'photo_file_name';

  // État
  static const String active = 'active';

  // Audit
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
        $mobilePhone TEXT,

        $birthDate TEXT,
        $comments TEXT,

        $avatarId TEXT NOT NULL DEFAULT 'default_01',
        $photoFileName TEXT,

        $active INTEGER NOT NULL DEFAULT 1,

        $createdAt TEXT NOT NULL,
        $updatedAt TEXT NOT NULL
      )
    ''');

    // Index
    await db.execute('''
      CREATE UNIQUE INDEX idx_players_uuid
      ON $tableName($uuid)
    ''');

    await db.execute('''
      CREATE INDEX idx_players_last_name
      ON $tableName($lastName)
    ''');

    await db.execute('''
      CREATE INDEX idx_players_first_name
      ON $tableName($firstName)
    ''');

    await db.execute('''
      CREATE INDEX idx_players_active
      ON $tableName($active)
    ''');
  }
}