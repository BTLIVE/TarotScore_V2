import 'package:flutter/material.dart';

import '../models/player.dart';

class PlayerListTile extends StatelessWidget {
  const PlayerListTile({
    super.key,
    required this.player,
    required this.onTap,
  });

  final Player player;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(
          player.firstName.isNotEmpty
              ? player.firstName[0].toUpperCase()
              : '?',
        ),
      ),
      title: Text(player.fullName),
      subtitle: Text(
        player.nickname?.isNotEmpty == true
            ? player.nickname!
            : (player.email ?? ''),
      ),
      trailing: player.active
          ? null
          : const Icon(
              Icons.block,
              color: Colors.red,
            ),
      onTap: onTap,
    );
  }
}