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
import '../models/rule_profile.dart';
import 'calculators/calculator.dart';
import 'pipeline/deal_calculation.dart';
import 'pipeline/deal_context.dart';

class RuleEngine {
  final List<Calculator> _calculators;

  RuleEngine({
    required Iterable<Calculator> calculators,
  }) : _calculators = List.unmodifiable(calculators);

  //--------------------------------------------------------------------------
  // Calcul
  //--------------------------------------------------------------------------

  DealCalculation calculate({
    required RuleProfile profile,
    required DealContext context,
    required Deal deal,
  }) {
    var calculation = DealCalculation(
      profile: profile,
      context: context,
      deal: deal,
    );

    for (final calculator in _calculators) {
      calculation = calculator.calculate(calculation);
    }

    return calculation;
  }
}