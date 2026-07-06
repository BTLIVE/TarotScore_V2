// ***************************************************************************
// TarotScore V2
//
// Fichier : contract_multiplier_calculator.dart
//
// Description : Application du multiplicateur de contrat.
//
// Auteur : David
// ***************************************************************************

import '../exceptions/invalid_deal_exception.dart';
import '../pipeline/deal_calculation.dart';
import 'calculator.dart';

class ContractMultiplierCalculator implements Calculator {
  const ContractMultiplierCalculator();

  @override
  DealCalculation calculate(
    DealCalculation calculation,
  ) {
    final baseScore = calculation.baseScore;
    final success = calculation.success;

    if (baseScore == null || success == null) {
      throw InvalidDealException(
        'Le score de base doit être calculé avant le multiplicateur.',
      );
    }

    final multiplier = switch (calculation.deal.contractId) {
      'petite' => 1,
      'garde' => 2,
      'garde_sans' => 4,
      'garde_contre' => 6,
      _ => throw InvalidDealException(
          'Contrat inconnu : ${calculation.deal.contractId}',
        ),
    };

    final contractScore = baseScore * multiplier;

    return calculation.copyWith(
      contractScore: success
          ? contractScore
          : -contractScore,
    );
  }
}