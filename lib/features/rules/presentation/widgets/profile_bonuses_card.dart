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

import 'rule_value_field.dart';

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
                  const Divider(height: 1),

                Padding(
                  padding: const EdgeInsets.all(
                    AppSpacing.md,
                  ),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      CheckboxListTile(
                        contentPadding:
                            EdgeInsets.zero,

                        controlAffinity:
                            ListTileControlAffinity.leading,

                        value: bonus.enabled,

                        title: Text(
                          bonus.name,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium,
                        ),

                        onChanged: profile.isEditable
                            ? (value) {
                                final updated =
                                    bonus.copyWith(
                                  enabled:
                                      value ??
                                          false,
                                );

                                onChanged(
                                  profile.updateBonus(
                                    updated,
                                  ),
                                );
                              }
                            : null,
                      ),

                      Padding(
                        padding:
                            const EdgeInsets.only(
                          left: AppSpacing.xl,
                          right: AppSpacing.sm,
                        ),
                        child: RuleValueField(
                          label: 'Valeur',

                          value: bonus.value,

                          min: 0,

                          max: 500,

                          onChanged:
                              profile.isEditable
                                  ? (value) {
                                      final updated =
                                          bonus.copyWith(
                                        value: value,
                                      );

                                      onChanged(
                                        profile
                                            .updateBonus(
                                          updated,
                                        ),
                                      );
                                    }
                                  : (_) {},
                        ),
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