// ***************************************************************************
//
// TarotScore V2
//
// Fichier : profile_bonuses_card.dart
//
// Description : Edition des bonus d'un profil de règles.
//
// Auteur : David
//
// ***************************************************************************

import 'package:flutter/material.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_card.dart';

import '../../models/bonus_rule.dart';
import '../../models/rule_profile.dart';

class ProfileBonusesCard extends StatelessWidget {
  const ProfileBonusesCard({
    super.key,
    required this.profile,
    required this.onChanged,
  });

  //---------------------------------------------------------------------------
  // Paramètres
  //---------------------------------------------------------------------------

  final RuleProfile profile;

  final ValueChanged<RuleProfile> onChanged;

  //---------------------------------------------------------------------------
  // UI
  //---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final bonuses = List<BonusRule>.from(
      profile.bonuses,
    )..sort(
        (a, b) => a.order.compareTo(b.order),
      );

    return AppCard(
      child: Column(
        children: List.generate(
          bonuses.length,
          (index) {
            final bonus = bonuses[index];

            return Column(
              children: [
                if (index > 0)
                  const Divider(
                    height: 1,
                  ),

                CheckboxListTile(
                  value: bonus.enabled,

                  controlAffinity:
                      ListTileControlAffinity.leading,

                  title: Text(
                    bonus.name,
                  ),

                  subtitle: Text(
                    'Valeur : ${bonus.value}',
                  ),

                  onChanged: (value) {
                    final updated =
                        bonus.copyWith(
                      enabled:
                          value ?? false,
                    );

                    onChanged(
                      profile.updateBonus(
                        updated,
                      ),
                    );
                  },
                ),

                Padding(
                  padding:
                      const EdgeInsets.only(
                    left: AppSpacing.xl,
                    right: AppSpacing.lg,
                    bottom: AppSpacing.md,
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.stars,
                        size: 18,
                      ),

                      const SizedBox(
                        width:
                            AppSpacing.sm,
                      ),

                      Text(
                        'Valeur : ${bonus.value}',
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}