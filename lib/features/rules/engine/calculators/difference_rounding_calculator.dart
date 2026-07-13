// ***************************************************************************
//
// TarotScore V2
//
// Fichier : difference_rounding_calculator.dart
//
// Description : Application de la règle de calcul de l'écart.
//
// Auteur : David
//
// ***************************************************************************

import '../../models/difference_calculation_mode.dart';
import '../exceptions/invalid_deal_exception.dart';
import '../pipeline/deal_calculation.dart';
import 'calculator.dart';

class DifferenceRoundingCalculator
    implements Calculator {
  const DifferenceRoundingCalculator();

  //--------------------------------------------------------------------------
  // Calcul
  //--------------------------------------------------------------------------

  @override
  DealCalculation calculate(
    DealCalculation calculation,
  ) {
    final rawDifference =
        calculation.rawDifference;

    if (rawDifference == null) {
      throw InvalidDealException(
        'L\'écart brut doit être calculé avant son traitement.',
      );
    }

    final difference =
        switch (calculation
            .profile
            .differenceCalculationMode) {
      DifferenceCalculationMode.exact =>
        rawDifference,

      DifferenceCalculationMode
            .roundedToTen =>
        _roundToTen(rawDifference),
    };

    return calculation.copyWith(
      difference: difference,
    );
  }

  //--------------------------------------------------------------------------
  // Outils
  //--------------------------------------------------------------------------

  double _roundToTen(
    double difference,
  ) {
    final sign =
        difference < 0 ? -1.0 : 1.0;

    final value =
        difference.abs();

    final rounded =
        (value / 10).round() * 10;

    return rounded * sign;
  }
}