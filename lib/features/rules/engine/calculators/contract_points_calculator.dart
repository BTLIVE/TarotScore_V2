// ***************************************************************************
//
// TarotScore V2
//
// Fichier : contract_points_calculator.dart
//
// Description : Calcul des points provenant du contrat.
//
// Auteur : David
//
// ***************************************************************************

import '../exceptions/invalid_deal_exception.dart';
import '../pipeline/deal_calculation.dart';
import 'calculator.dart';

class ContractPointsCalculator
    implements Calculator {
  const ContractPointsCalculator();

  //--------------------------------------------------------------------------
  // Calcul
  //--------------------------------------------------------------------------

  @override
  DealCalculation calculate(
    DealCalculation calculation,
  ) {
    final contract =
        calculation.profile.contract(
      calculation.deal.contractId,
    );

    if (contract == null) {
      throw InvalidDealException(
        'Contrat inconnu : '
        '${calculation.deal.contractId}',
      );
    }

    final contractPoints =
        calculation.profile.basePoints *
        contract.baseMultiplier;

    return calculation.copyWith(
      contractPoints: contractPoints,
    );
  }
}