// ***************************************************************************
//
// TarotScore V2
//
// Fichier : dealer_selection_card.dart
//
// Description : Sélection du premier donneur.
//
// Auteur : David
//
// ***************************************************************************
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../../../core/widgets/app_card.dart';
import '../../models/session_player.dart';

class DealerSelectionCard extends StatelessWidget {
  const DealerSelectionCard({
    super.key,
    required this.players,
    required this.dealer,
    required this.onDealerChanged,
  });

  final List<SessionPlayer> players;

  final SessionPlayer? dealer;

  final ValueChanged<SessionPlayer> onDealerChanged;

  @override
  Widget build(BuildContext context) {
    final selectedPlayers =
        players.where((player) => player.selected).toList();

    return AppCard(
      child: selectedPlayers.length < 3
          ? const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Sélectionnez au moins 3 joueurs.',
              ),
            )
          : Column(
              children: selectedPlayers
                  .map(
                    (sessionPlayer) => RadioListTile<SessionPlayer>(
                      value: sessionPlayer,
                      groupValue: dealer,
                      title: Text(
                        '${sessionPlayer.player.firstName} ${sessionPlayer.player.lastName}',
                      ),
                      subtitle:
                          sessionPlayer.player.nickname != null &&
                                  sessionPlayer
                                      .player
                                      .nickname!
                                      .isNotEmpty
                              ? Text(
                                  sessionPlayer.player.nickname!,
                                )
                              : null,
                      onChanged: (value) {
                        if (value != null) {
                          onDealerChanged(value);
                        }
                      },
                    ),
                  )
                  .toList(),
            ),
    );
  }
}