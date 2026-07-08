// ***************************************************************************
//
// TarotScore V2
//
// Fichier : deal_bonus_card.dart
//
// Description : Sélection des bonus.
//
// Auteur : David
//
// ***************************************************************************

import 'package:flutter/material.dart';

import '../../../../../core/widgets/app_card.dart';
import '../../../../rules/models/bonus_rule.dart';

class DealBonusCard extends StatelessWidget {
  const DealBonusCard({
    super.key,
    required this.bonuses,
    required this.selectedBonusIds,
    required this.onChanged,
  });

  final List<BonusRule> bonuses;

  final Set<String> selectedBonusIds;

  final ValueChanged<Set<String>> onChanged;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bonus',
            style: Theme.of(context).textTheme.titleMedium,
          ),

          const SizedBox(height: 12),

          if (bonuses.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 8,
              ),
              child: Text(
                'Aucun bonus disponible.',
              ),
            )
          else
            ...bonuses.map(
              (bonus) {
                return CheckboxListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  controlAffinity:
                      ListTileControlAffinity.leading,
                  title: Text(bonus.name),
                  value: selectedBonusIds.contains(
                    bonus.id,
                  ),
                  onChanged: (checked) {
                    final values =
                        Set<String>.from(
                      selectedBonusIds,
                    );

                    if (checked ?? false) {
                      values.add(
                        bonus.id,
                      );
                    } else {
                      values.remove(
                        bonus.id,
                      );
                    }

                    onChanged(values);
                  },
                );
              },
            ),
        ],
      ),
    );
  }
}