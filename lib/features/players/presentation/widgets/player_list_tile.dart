// ***************************************************************************
//
// TarotScore V2
//
// Fichier : player_list_tile.dart
//
// Description : Tuile d'affichage d'un joueur.
//
// Auteur : David
//
// ***************************************************************************

import 'package:flutter/material.dart';

import '../../../../core/widgets/app_list_tile.dart';
import '../../avatar/widgets/avatar_view.dart';
import '../../models/player.dart';

class PlayerListTile extends StatelessWidget {
  final Player player;

  final VoidCallback? onTap;

  const PlayerListTile({
    super.key,
    required this.player,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppListTile(
      leading: AvatarView(
        avatarId: player.avatarId,
        radius: 22,
      ),
      title: Text(
        player.fullName,
      ),
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