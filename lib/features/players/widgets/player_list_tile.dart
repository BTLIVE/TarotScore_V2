import 'package:flutter/material.dart';

import '../avatar/widgets/avatar_view.dart';
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
      leading: AvatarView(
        avatarId: player.avatarId,
        radius: 22,
      ),
      title: Text(player.fullName),
      subtitle: Text(
        player.hasNickname
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