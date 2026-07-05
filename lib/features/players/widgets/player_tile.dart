import 'package:flutter/material.dart';

import '../models/player.dart';

/// Widget représentant un joueur dans une liste.
class PlayerTile extends StatelessWidget {
  final Player player;
  final VoidCallback? onTap;

  const PlayerTile({
    super.key,
    required this.player,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(
            player.firstName.isNotEmpty
                ? player.firstName[0].toUpperCase()
                : '?',
          ),
        ),
        title: Text(
          player.fullName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: player.nickname != null &&
                player.nickname!.trim().isNotEmpty
            ? Text(player.nickname!)
            : null,
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}