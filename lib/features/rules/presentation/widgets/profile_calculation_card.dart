// ***************************************************************************
//
// TarotScore V2
//
// Fichier : profile_calculation_card.dart
//
// Description : Edition des objectifs de contrat.
//
// Auteur : David
//
// ***************************************************************************

import 'package:flutter/material.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_card.dart';

import '../../models/rule_profile.dart';

import 'rule_value_field.dart';

class ProfileCalculationCard extends StatelessWidget {
  const ProfileCalculationCard({
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
    return AppCard(
      child: Padding(
        padding: const EdgeInsets.all(
          AppSpacing.md,
        ),
        child: Column(
          children: [
            RuleValueField(
              label: '0 bout',
              value: profile.targetScore(0) ?? 56,
              min: 0,
              max: 100,
              onChanged: profile.isEditable
                  ? (value) {
                      final scores =
                          Map<int, int>.from(
                        profile.targetScores,
                      );

                      scores[0] = value;

                      onChanged(
                        profile.copyWith(
                          targetScores: scores,
                        ),
                      );
                    }
                  : (_) {},
            ),

            const Divider(),

            RuleValueField(
              label: '1 bout',
              value: profile.targetScore(1) ?? 51,
              min: 0,
              max: 100,
              onChanged: profile.isEditable
                  ? (value) {
                      final scores =
                          Map<int, int>.from(
                        profile.targetScores,
                      );

                      scores[1] = value;

                      onChanged(
                        profile.copyWith(
                          targetScores: scores,
                        ),
                      );
                    }
                  : (_) {},
            ),

            const Divider(),

            RuleValueField(
              label: '2 bouts',
              value: profile.targetScore(2) ?? 41,
              min: 0,
              max: 100,
              onChanged: profile.isEditable
                  ? (value) {
                      final scores =
                          Map<int, int>.from(
                        profile.targetScores,
                      );

                      scores[2] = value;

                      onChanged(
                        profile.copyWith(
                          targetScores: scores,
                        ),
                      );
                    }
                  : (_) {},
            ),

            const Divider(),

            RuleValueField(
              label: '3 bouts',
              value: profile.targetScore(3) ?? 36,
              min: 0,
              max: 100,
              onChanged: profile.isEditable
                  ? (value) {
                      final scores =
                          Map<int, int>.from(
                        profile.targetScores,
                      );

                      scores[3] = value;

                      onChanged(
                        profile.copyWith(
                          targetScores: scores,
                        ),
                      );
                    }
                  : (_) {},
            ),
          ],
        ),
      ),
    );
  }
}