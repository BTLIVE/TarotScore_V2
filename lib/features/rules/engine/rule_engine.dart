// ***************************************************************************
// TarotScore V2
//
// Fichier : rule_engine.dart
//
// Description : Orchestre le pipeline de calcul.
//
// Auteur : David
// ***************************************************************************

import '../../sessions/models/deal.dart';
import '../../sessions/models/session.dart';
import 'calculators/calculator.dart';
import 'pipeline/deal_calculation.dart';

class RuleEngine {
  final List<Calculator> _calculators;

  RuleEngine({
    required Iterable<Calculator> calculators,
  }) : _calculators = List.unmodifiable(calculators);

  DealCalculation calculate({
    required Session session,
    required Deal deal,
  }) {
    var calculation = DealCalculation(
      session: session,
      deal: deal,
    );

    for (final calculator in _calculators) {
      calculation = calculator.calculate(calculation);
    }

    return calculation;
  }
}