// ***************************************************************************
//
// TarotScore V2
//
// Fichier : player_actions_sheet.dart
//
// Description : Actions disponibles pour un joueur.
//
// Auteur : David
//
// ***************************************************************************

import 'package:flutter/material.dart';

class PlayerActionsSheet extends StatelessWidget {
  const PlayerActionsSheet({
    super.key,
    required this.onEdit,
    required this.onToggleActive,
    required this.onDelete,
    required this.active,
  });

  final bool active;

  final VoidCallback onEdit;

  final VoidCallback onToggleActive;

  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Wrap(
        children: [

          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Modifier'),
            onTap: onEdit,
          ),

          ListTile(
            leading: Icon(
              active
                  ? Icons.block
                  : Icons.check_circle,
            ),
            title: Text(
              active
                  ? 'Désactiver'
                  : 'Réactiver',
            ),
            onTap: onToggleActive,
          ),

          const Divider(),

          ListTile(
            leading: const Icon(
              Icons.delete_forever,
              color: Colors.red,
            ),
            title: const Text(
              'Supprimer définitivement',
            ),
            textColor: Colors.red,
            iconColor: Colors.red,
            onTap: onDelete,
          ),

        ],
      ),
    );
  }
}