// ***************************************************************************
// TarotScore V2
//
// Fichier : base_score_calculator.dart
//
// Description : Calcul du score de base d'une manche.
//
// Auteur : David
// ***************************************************************************

import '../exceptions/invalid_deal_exception.dart';
import '../pipeline/deal_calculation.dart';
import 'calculator.dart';

class BaseScoreCalculator implements Calculator {
  const BaseScoreCalculator();

  //--------------------------------------------------------------------------
  // Calcul
  //--------------------------------------------------------------------------

  @override
  DealCalculation calculate(
    DealCalculation calculation,
  ) {
    final target = calculation.profile.targetScore(
      calculation.deal.oudlers,
    );

    if (target == null) {
      throw InvalidDealException(
        'Impossible de déterminer le score cible.',
      );
    }

    final difference =
        calculation.deal.points - target;

    final success = difference >= 0;

    final baseScore =
        25 + difference.abs().round();

    return calculation.copyWith(
      success: success,

      target: target.toDouble(),

      difference: difference,

      baseScore: baseScore,
    );
  }
}