// ***************************************************************************
//
// TarotScore V2
//
// Fichier : difference_points_calculator.dart
//
// Description : Calcul des points provenant de l'écart.
//
// Auteur : David
//
// ***************************************************************************

import '../exceptions/invalid_deal_exception.dart';
import '../pipeline/deal_calculation.dart';
import 'calculator.dart';

class DifferencePointsCalculator
    implements Calculator {
  const DifferencePointsCalculator();

  //--------------------------------------------------------------------------
  // Calcul
  //--------------------------------------------------------------------------

  @override
  DealCalculation calculate(
    DealCalculation calculation,
  ) {
    final difference =
        calculation.difference;

    if (difference == null) {
      throw InvalidDealException(
        'L\'écart doit être calculé avant les points d\'écart.',
      );
    }

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

    final differencePoints =
        (difference *
                contract
                    .differenceMultiplier)
            .round();

    return calculation.copyWith(
      differencePoints:
          differencePoints,
    );
  }
}