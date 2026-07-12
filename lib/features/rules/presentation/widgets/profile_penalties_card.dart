// ***************************************************************************
//
// TarotScore V2
//
// Fichier : profile_penalties_card.dart
//
// Description : Edition des pénalités d'un profil de règles.
//
// Auteur : David
//
// ***************************************************************************

import 'package:flutter/material.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_card.dart';

import '../../models/penalty_rule.dart';
import '../../models/rule_profile.dart';

import 'rule_value_field.dart';

class ProfilePenaltiesCard extends StatelessWidget {
  const ProfilePenaltiesCard({
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
    final penalties = List<PenaltyRule>.from(
      profile.penalties,
    )..sort(
        (a, b) => a.order.compareTo(b.order),
      );

    return AppCard(
      child: Column(
        children: List.generate(
          penalties.length,
          (index) {
            final penalty = penalties[index];

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

                        value: penalty.enabled,

                        title: Text(
                          penalty.name,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium,
                        ),

                        onChanged: profile.isEditable
                            ? (value) {
                                final updated =
                                    penalty.copyWith(
                                  enabled:
                                      value ??
                                          false,
                                );

                                onChanged(
                                  profile.updatePenalty(
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

                          value: penalty.value,

                          min: 0,

                          max: 500,

                          onChanged:
                              profile.isEditable
                                  ? (value) {
                                      final updated =
                                          penalty.copyWith(
                                        value: value,
                                      );

                                      onChanged(
                                        profile
                                            .updatePenalty(
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