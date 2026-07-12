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
            final penalty =
                penalties[index];

            return Column(
              children: [
                if (index > 0)
                  const Divider(
                    height: 1,
                  ),

                CheckboxListTile(
                  value: penalty.enabled,

                  controlAffinity:
                      ListTileControlAffinity
                          .leading,

                  title: Text(
                    penalty.name,
                  ),

                  subtitle: Text(
                    'Valeur : ${penalty.value}',
                  ),

                  onChanged: (value) {
                    final updated =
                        penalty.copyWith(
                      enabled:
                          value ?? false,
                    );

                    onChanged(
                      profile.updatePenalty(
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
                        Icons.warning_amber,
                        size: 18,
                      ),

                      const SizedBox(
                        width:
                            AppSpacing.sm,
                      ),

                      Text(
                        'Valeur : ${penalty.value}',
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