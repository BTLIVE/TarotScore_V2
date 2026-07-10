// ***************************************************************************
//
// TarotScore V2
//
// Fichier : table_order_card.dart
//
// Description : Définition de l'ordre des joueurs autour de la table.
//
// Auteur : David
//
// ***************************************************************************

import 'package:flutter/material.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_card.dart';

import '../../models/session_player.dart';

class TableOrderCard extends StatelessWidget {
  const TableOrderCard({
    super.key,
    required this.players,
    required this.onChanged,
  });

  /// Joueurs sélectionnés dans leur ordre actuel.
  final List<SessionPlayer> players;

  /// Appelé après un changement d'ordre.
  final ValueChanged<List<SessionPlayer>>
      onChanged;

  @override
  Widget build(BuildContext context) {
    if (players.length < 3) {
      return const AppCard(
        child: Padding(
          padding: EdgeInsets.all(
            AppSpacing.md,
          ),
          child: Text(
            'Sélectionnez au moins trois joueurs '
            'pour définir leur disposition autour '
            'de la table.',
          ),
        ),
      );
    }

    return AppCard(
      child: SizedBox(
        height: 320,
        child: ReorderableListView.builder(
          buildDefaultDragHandles: true,
          itemCount: players.length,
          onReorder: (oldIndex, newIndex) {
            final reordered =
                List<SessionPlayer>.from(
              players,
            );

            if (newIndex > oldIndex) {
              newIndex--;
            }

            final player =
                reordered.removeAt(
              oldIndex,
            );

            reordered.insert(
              newIndex,
              player,
            );

            onChanged(
              List.unmodifiable(
                reordered,
              ),
            );
          },
          itemBuilder:
              (context, index) {
            final player =
                players[index];

            return ListTile(
              key: ValueKey(
                player.player.uuid,
              ),
              leading: CircleAvatar(
                child: Text(
                  '${index + 1}',
                ),
              ),
              title: Text(
                player.player.displayName,
              ),
              trailing: const Icon(
                Icons.drag_handle,
              ),
            );
          },
        ),
      ),
    );
  }
}