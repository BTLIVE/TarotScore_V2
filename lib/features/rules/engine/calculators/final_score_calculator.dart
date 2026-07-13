// ***************************************************************************
//
// TarotScore V2
//
// Fichier : final_score_calculator.dart
//
// Description : Calcul du score final de la donne.
//
// Auteur : David
//
// ***************************************************************************

import '../exceptions/invalid_deal_exception.dart';
import '../pipeline/deal_calculation.dart';
import 'calculator.dart';

class FinalScoreCalculator
    implements Calculator {
  const FinalScoreCalculator();

  //--------------------------------------------------------------------------
  // Calcul
  //--------------------------------------------------------------------------

  @override
  DealCalculation calculate(
    DealCalculation calculation,
  ) {
    final contractPoints =
        calculation.contractPoints;

    if (contractPoints == null) {
      throw InvalidDealException(
        'Les points du contrat doivent être calculés avant le score final.',
      );
    }

    final differencePoints =
        calculation.differencePoints;

    if (differencePoints == null) {
      throw InvalidDealException(
        'Les points d\'écart doivent être calculés avant le score final.',
      );
    }

    final finalScore =
        contractPoints +
        differencePoints +
        calculation.bonusPoints -
        calculation.penaltyPoints;

    return calculation.copyWith(
      finalScore: finalScore,
    );
  }
}