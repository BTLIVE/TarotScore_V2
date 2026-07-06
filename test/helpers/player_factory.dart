import 'package:uuid/uuid.dart';

import 'package:tarotscore_v2/features/players/models/player.dart';

class PlayerFactory {
  const PlayerFactory._();

  static Player create({
    String? firstName,
    String? lastName,
  }) {
    final now = DateTime.now();

    return Player(
      uuid: const Uuid().v4(),
      firstName: firstName ?? 'John',
      lastName: lastName ?? 'Doe',
      createdAt: now,
      updatedAt: now,
    );
  }

  static List<Player> threePlayers() => [
        create(firstName: 'Alice'),
        create(firstName: 'Bob'),
        create(firstName: 'Charlie'),
      ];

  static List<Player> fourPlayers() => [
        create(firstName: 'Alice'),
        create(firstName: 'Bob'),
        create(firstName: 'Charlie'),
        create(firstName: 'David'),
      ];

  static List<Player> fivePlayers() => [
        create(firstName: 'Alice'),
        create(firstName: 'Bob'),
        create(firstName: 'Charlie'),
        create(firstName: 'David'),
        create(firstName: 'Emma'),
      ];
}