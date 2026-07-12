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
import '../../models/rule_profile.dart';

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
        (a, b) =>
            a.order.compareTo(b.order),
      );

    return AppCard(
      child: Column(
        children: List.generate(
          contracts.length,
          (index) {
            final contract =
                contracts[index];

            return Column(
              children: [
                if (index > 0)
                  const Divider(height: 1),

                CheckboxListTile(
                  value: contract.enabled,

                  title: Text(
                    contract.name,
                  ),

                  subtitle: Text(
                    'Multiplicateur : '
                    '${contract.multiplier}',
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

                    final newContracts =
                        contracts
                            .map(
                              (item) =>
                                  item.id ==
                                          updated.id
                                      ? updated
                                      : item,
                            )
                            .toList();

                    onChanged(
                      profile.copyWith(
                        contracts:
                            newContracts,
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
                        Icons.calculate,
                        size: 18,
                      ),

                      const SizedBox(
                        width:
                            AppSpacing.sm,
                      ),

                      Text(
                        'Multiplicateur : '
                        '${contract.multiplier}',
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