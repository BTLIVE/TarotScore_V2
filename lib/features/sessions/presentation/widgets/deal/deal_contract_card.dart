// ***************************************************************************
//
// TarotScore V2
//
// Fichier : deal_contract_card.dart
//
// Description : Sélection du contrat.
//
// Auteur : David
//
// ***************************************************************************

import 'package:flutter/material.dart';

import '../../../../../core/widgets/app_card.dart';
import '../../../../rules/models/contract_rule.dart';

class DealContractCard extends StatelessWidget {
  const DealContractCard({
    super.key,
    required this.contracts,
    required this.selectedContractId,
    required this.onChanged,
  });

  final List<ContractRule> contracts;

  final String? selectedContractId;

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contrat',
            style: Theme.of(context).textTheme.titleMedium,
          ),

          const SizedBox(height: 8),

          ...contracts.map(
            (contract) {
              return RadioListTile<String>(
                value: contract.id,
                groupValue: selectedContractId,
                title: Text(contract.name),
                subtitle: Text(
                  'Coefficient ×${contract.multiplier}',
                ),
                onChanged: (value) {
                  if (value != null) {
                    onChanged(value);
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}