// ***************************************************************************
//
// TarotScore V2
//
// Fichier : target_calculator.dart
//
// Description : Détermination du score cible.
//
// Auteur : David
//
// ***************************************************************************

import '../exceptions/invalid_deal_exception.dart';
import '../pipeline/deal_calculation.dart';
import 'calculator.dart';

class TargetCalculator
    implements Calculator {
  const TargetCalculator();

  //--------------------------------------------------------------------------
  // Calcul
  //--------------------------------------------------------------------------

  @override
  DealCalculation calculate(
    DealCalculation calculation,
  ) {
    final target =
        calculation.profile.targetScore(
      calculation.deal.oudlers,
    );

    if (target == null) {
      throw InvalidDealException(
        'Impossible de déterminer le score cible.',
      );
    }

    return calculation.copyWith(
      target: target.toDouble(),
    );
  }
}