// ***************************************************************************
//
// TarotScore V2
//
// Fichier : contract_multiplier_calculator.dart
//
// Description : Application du multiplicateur de contrat.
//
// Auteur : David
//
// ***************************************************************************

import '../exceptions/invalid_deal_exception.dart';
import '../pipeline/deal_calculation.dart';
import 'calculator.dart';

class ContractMultiplierCalculator
    implements Calculator {
  const ContractMultiplierCalculator();

  //--------------------------------------------------------------------------
  // Calcul
  //--------------------------------------------------------------------------

  @override
  DealCalculation calculate(
    DealCalculation calculation,
  ) {
    final baseScore = calculation.baseScore;
    final success = calculation.success;

    if (baseScore == null ||
        success == null) {
      throw InvalidDealException(
        'Le score de base doit être calculé avant le multiplicateur.',
      );
    }

    final contract =
        calculation.profile.contract(
      calculation.deal.contractId,
    );

    if (contract == null) {
      throw InvalidDealException(
        'Contrat inconnu : ${calculation.deal.contractId}',
      );
    }

    final multiplier =
        contract.multiplier;

    final contractScore =
        baseScore * multiplier;

    final signedScore = success
        ? contractScore
        : -contractScore;

    return calculation.copyWith(
      contractMultiplier:
          multiplier,
      contractScore: signedScore,
      finalScore: signedScore,
    );
  }
}