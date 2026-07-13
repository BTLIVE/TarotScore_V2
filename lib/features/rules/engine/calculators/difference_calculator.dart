// ***************************************************************************
//
// TarotScore V2
//
// Fichier : difference_calculator.dart
//
// Description : Calcul de l'écart brut.
//
// Auteur : David
//
// ***************************************************************************

import '../exceptions/invalid_deal_exception.dart';
import '../pipeline/deal_calculation.dart';
import 'calculator.dart';

class DifferenceCalculator
    implements Calculator {
  const DifferenceCalculator();

  //---------------------------------------------------------------------------
  // Calcul
  //---------------------------------------------------------------------------

  @override
  DealCalculation calculate(
    DealCalculation calculation,
  ) {
    final target = calculation.target;

    if (target == null) {
      throw InvalidDealException(
        'Le score cible doit être calculé avant l\'écart.',
      );
    }

    final difference =
        calculation.deal.points - target;

    return calculation.copyWith(
      success: difference >= 0,
      rawDifference: difference,
    );
  }
}