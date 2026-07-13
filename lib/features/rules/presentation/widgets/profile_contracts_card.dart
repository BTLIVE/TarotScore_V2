// ***************************************************************************
//
// TarotScore V2
//
// Fichier : profile_contracts_card.dart
//
// Description : Edition des contrats d'un profil de règles.
//
// Auteur : David
//
// ***************************************************************************

import 'package:flutter/material.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_card.dart';

import '../../models/contract_rule.dart';
import '../../models/difference_calculation_mode.dart';
import '../../models/rule_profile.dart';
import 'rule_value_field.dart';

class ProfileContractsCard extends StatelessWidget {
  const ProfileContractsCard({
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
    final contracts = List<ContractRule>.from(
      profile.contracts,
    )..sort(
        (a, b) => a.order.compareTo(b.order),
      );

    return AppCard(
      child: Column(
        children: [
          //------------------------------------------------------------------
          // Paramètres généraux
          //------------------------------------------------------------------

          Padding(
            padding: const EdgeInsets.all(
              AppSpacing.lg,
            ),
            child: RuleValueField(
              label: 'Points de base',
              value: profile.basePoints,
              onChanged: (value) {
                onChanged(
                  profile.copyWith(
                    basePoints: value,
                  ),
                );
              },
            ),
          ),

          const Divider(height: 1),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.md,
            ),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                const Text(
                  'Calcul de l\'écart',
                  style: TextStyle(
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                RadioListTile<
                    DifferenceCalculationMode>(
                  contentPadding:
                      EdgeInsets.zero,
                  title: const Text(
                    'Exact',
                  ),
                  value:
                      DifferenceCalculationMode
                          .exact,
                  groupValue: profile
                      .differenceCalculationMode,
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }

                    onChanged(
                      profile.copyWith(
                        differenceCalculationMode:
                            value,
                      ),
                    );
                  },
                ),

                RadioListTile<
                    DifferenceCalculationMode>(
                  contentPadding:
                      EdgeInsets.zero,
                  title: const Text(
                    'Arrondi à la dizaine',
                  ),
                  value:
                      DifferenceCalculationMode
                          .roundedToTen,
                  groupValue: profile
                      .differenceCalculationMode,
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }

                    onChanged(
                      profile.copyWith(
                        differenceCalculationMode:
                            value,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          const Divider(height: 1),

          //------------------------------------------------------------------
          // Contrats
          //------------------------------------------------------------------

          ...List.generate(
            contracts.length,
            (index) {
              final contract =
                  contracts[index];

              return Column(
                children: [
                  CheckboxListTile(
                    value: contract.enabled,
                    title: Text(
                      contract.name,
                    ),
                    controlAffinity:
                        ListTileControlAffinity
                            .leading,
                    onChanged: (value) {
                      final updated =
                          contract.copyWith(
                        enabled:
                            value ?? false,
                      );

                      onChanged(
                        profile.updateContract(
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
                    ),
                    child: RuleValueField(
                      label:
                          'Multiplicateur contrat',
                      value: contract
                          .baseMultiplier,
                      onChanged: (value) {
                        final updated =
                            contract.copyWith(
                          baseMultiplier:
                              value,
                        );

                        onChanged(
                          profile.updateContract(
                            updated,
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(
                    height: AppSpacing.md,
                  ),

                  Padding(
                    padding:
                        const EdgeInsets.only(
                      left: AppSpacing.xl,
                      right: AppSpacing.lg,
                      bottom: AppSpacing.md,
                    ),
                    child: RuleValueField(
                      label:
                          'Multiplicateur écart',
                      value: contract
                          .differenceMultiplier,
                      onChanged: (value) {
                        final updated =
                            contract.copyWith(
                          differenceMultiplier:
                              value,
                        );

                        onChanged(
                          profile.updateContract(
                            updated,
                          ),
                        );
                      },
                    ),
                  ),

                  if (index <
                      contracts.length - 1)
                    const Divider(
                      height: 1,
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}