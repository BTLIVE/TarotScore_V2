// ***************************************************************************
//
// TarotScore V2
//
// Fichier : deal_players_card.dart
//
// Description : Sélection du preneur et du partenaire.
//
// Auteur : David
//
// ***************************************************************************

import 'package:flutter/material.dart';

import '../../../../../core/widgets/app_card.dart';
import '../../../../players/models/player.dart';

class DealPlayersCard extends StatelessWidget {
  const DealPlayersCard({
    super.key,
    required this.players,
    required this.playerPositions,
    required this.takerPosition,
    required this.onTakerChanged,
    this.partnerPosition,
    this.onPartnerChanged,
  });

  /// Joueurs actifs de la donne.
  final List<Player> players;

  /// Position réelle de chaque joueur dans la session.
  ///
  /// Exemple pour une partie à 7 joueurs avec deux morts :
  ///
  /// players :
  ///   Jean
  ///   Paul
  ///   Marc
  ///   Luc
  ///   David
  ///
  /// playerPositions :
  ///   0
  ///   2
  ///   3
  ///   5
  ///   6
  final List<int> playerPositions;

  /// Position du preneur dans la session.
  final int? takerPosition;

  final ValueChanged<int> onTakerChanged;

  /// Position du partenaire dans la session.
  final int? partnerPosition;

  final ValueChanged<int?>? onPartnerChanged;

  @override
  Widget build(BuildContext context) {
    final isFivePlayers = players.length == 5;

    return AppCard(
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Text(
            'Preneur',
            style: Theme.of(context)
                .textTheme
                .titleMedium,
          ),

          const SizedBox(height: 8),

          ...List.generate(
            players.length,
            (index) {
              final player =
                  players[index];

              final position =
                  playerPositions[index];

              return RadioListTile<int>(
                value: position,
                groupValue: takerPosition,
                title: Text(
                  '${player.firstName} ${player.lastName}',
                ),
                onChanged: (value) {
                  if (value != null) {
                    onTakerChanged(value);
                  }
                },
              );
            },
          ),

          if (isFivePlayers) ...[
            const Divider(),

            Text(
              'Partenaire',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium,
            ),

            const SizedBox(height: 8),

            RadioListTile<int?>(
              value: null,
              groupValue: partnerPosition,
              title: const Text(
                'Aucun',
              ),
              onChanged:
                  onPartnerChanged,
            ),

            ...List.generate(
              players.length,
              (index) {
                final position =
                    playerPositions[index];

                if (position ==
                    takerPosition) {
                  return const SizedBox
                      .shrink();
                }

                final player =
                    players[index];

                return RadioListTile<int?>(
                  value: position,
                  groupValue:
                      partnerPosition,
                  title: Text(
                    '${player.firstName} ${player.lastName}',
                  ),
                  onChanged:
                      onPartnerChanged,
                );
              },
            ),
          ],
        ],
      ),
    );
  }
}