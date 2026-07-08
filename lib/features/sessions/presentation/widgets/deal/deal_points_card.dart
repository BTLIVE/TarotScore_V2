// ***************************************************************************
//
// TarotScore V2
//
// Fichier : deal_points_card.dart
//
// Description : Saisie des bouts et des points réalisés.
//
// Auteur : David
//
// ***************************************************************************

import 'package:flutter/material.dart';

import '../../../../../core/widgets/app_card.dart';

class DealPointsCard extends StatelessWidget {
  const DealPointsCard({
    super.key,
    required this.oudlers,
    required this.pointsController,
    required this.onOudlersChanged,
  });

  final int oudlers;

  final TextEditingController pointsController;

  final ValueChanged<int> onOudlersChanged;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Résultat',
            style: Theme.of(context).textTheme.titleMedium,
          ),

          const SizedBox(height: 12),

          DropdownButtonFormField<int>(
            value: oudlers,
            decoration: const InputDecoration(
              labelText: 'Nombre de bouts',
            ),
            items: const [
              DropdownMenuItem(
                value: 0,
                child: Text('0 bout'),
              ),
              DropdownMenuItem(
                value: 1,
                child: Text('1 bout'),
              ),
              DropdownMenuItem(
                value: 2,
                child: Text('2 bouts'),
              ),
              DropdownMenuItem(
                value: 3,
                child: Text('3 bouts'),
              ),
            ],
            onChanged: (value) {
              if (value != null) {
                onOudlersChanged(value);
              }
            },
          ),

          const SizedBox(height: 16),

          TextFormField(
            controller: pointsController,
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
            ),
            decoration: const InputDecoration(
              labelText: 'Points réalisés',
              hintText: 'Ex. 47',
            ),
          ),
        ],
      ),
    );
  }
}