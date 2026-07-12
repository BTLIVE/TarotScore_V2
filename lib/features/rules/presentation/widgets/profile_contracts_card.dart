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
        children: List.generate(
          contracts.length,
          (index) {
            final contract = contracts[index];

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

                        value: contract.enabled,

                        title: Text(
                          contract.name,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium,
                        ),

                        onChanged: profile.isEditable
                            ? (value) {
                                final updated =
                                    contract.copyWith(
                                  enabled:
                                      value ??
                                          false,
                                );

                                onChanged(
                                  profile.updateContract(
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
                          label:
                              'Multiplicateur',

                          value:
                              contract.multiplier,

                          min: 1,

                          max: 20,

                          onChanged:
                              profile.isEditable
                                  ? (value) {
                                      final updated =
                                          contract.copyWith(
                                        multiplier:
                                            value,
                                      );

                                      onChanged(
                                        profile
                                            .updateContract(
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