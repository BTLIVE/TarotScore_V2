// ***************************************************************************
//
// TarotScore V2
//
// Fichier : player_selection_card.dart
//
// Description : Sélection des joueurs d'une nouvelle partie.
//
// Auteur : David
//
// ***************************************************************************

import 'package:flutter/material.dart';

import '../../../../core/widgets/app_card.dart';
import '../../models/session_player.dart';

class PlayerSelectionCard extends StatelessWidget {
  const PlayerSelectionCard({
    super.key,
    required this.players,
    required this.onChanged,
  });

  final List<SessionPlayer> players;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    final selectedCount =
        players.where((p) => p.selected).length;

    return AppCard(
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          if (players.isEmpty)
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Aucun joueur actif disponible.',
              ),
            )
          else
            ListView.separated(
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(),
              itemCount: players.length,
              separatorBuilder:
                  (context, index) =>
                      const Divider(height: 1),
              itemBuilder: (context, index) {
                final sessionPlayer =
                    players[index];

                final player =
                    sessionPlayer.player;

                return CheckboxListTile(
                  value: sessionPlayer.selected,
                  controlAffinity:
                      ListTileControlAffinity
                          .leading,
                  title: Text(
                    '${player.firstName} ${player.lastName}',
                  ),
                  subtitle:
                      (player.nickname != null &&
                              player.nickname!
                                  .isNotEmpty)
                          ? Text(
                              player.nickname!,
                            )
                          : null,
                  onChanged: (value) {
                    sessionPlayer.selected =
                        value ?? false;

                    onChanged();
                  },
                );
              },
            ),

          const Divider(),

          Padding(
            padding:
                const EdgeInsets.only(top: 8),
            child: Text(
              selectedCount == 0
                  ? 'Aucun joueur sélectionné'
                  : '$selectedCount joueur${selectedCount > 1 ? 's' : ''} sélectionné${selectedCount > 1 ? 's' : ''}',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}