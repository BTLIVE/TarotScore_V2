import '../../../../../core/database/tables/player_table.dart';

/// Représente un joueur de TarotScore.
class Player {
  final int? id;
  final String uuid;
  final String firstName;
  final String lastName;
  final String? nickname;
  final String? email;
  final String? phone;
  final String? avatar;
  final bool active;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Player({
    this.id,
    required this.uuid,
    required this.firstName,
    required this.lastName,
    this.nickname,
    this.email,
    this.phone,
    this.avatar,
    this.active = true,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Nom complet du joueur.
  String get fullName => '$firstName $lastName';

  /// Retourne un nouveau Player en modifiant uniquement
  /// les propriétés renseignées.
  Player copyWith({
    int? id,
    String? uuid,
    String? firstName,
    String? lastName,
    String? nickname,
    String? email,
    String? phone,
    String? avatar,
    bool? active,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Player(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      nickname: nickname ?? this.nickname,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      avatar: avatar ?? this.avatar,
      active: active ?? this.active,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  /// Conversion vers une Map pour SQLite.
  Map<String, dynamic> toMap() {
    return {
      PlayerTable.id: id,
      PlayerTable.uuid: uuid,
      PlayerTable.firstName: firstName,
      PlayerTable.lastName: lastName,
      PlayerTable.nickname: nickname,
      PlayerTable.email: email,
      PlayerTable.phone: phone,
      PlayerTable.avatar: avatar,
      PlayerTable.active: active ? 1 : 0,
      PlayerTable.createdAt: createdAt.toIso8601String(),
      PlayerTable.updatedAt: updatedAt.toIso8601String(),
    };
  }

  /// Création d'un Player à partir d'une Map SQLite.
  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
      id: map[PlayerTable.id] as int?,
      uuid: map[PlayerTable.uuid] as String,
      firstName: map[PlayerTable.firstName] as String,
      lastName: map[PlayerTable.lastName] as String,
      nickname: map[PlayerTable.nickname] as String?,
      email: map[PlayerTable.email] as String?,
      phone: map[PlayerTable.phone] as String?,
      avatar: map[PlayerTable.avatar] as String?,
      active: (map[PlayerTable.active] as int) == 1,
      createdAt: DateTime.parse(map[PlayerTable.createdAt] as String),
      updatedAt: DateTime.parse(map[PlayerTable.updatedAt] as String),
    );
  }

  @override
  String toString() {
    return 'Player(id: $id, name: $fullName)';
  }
}