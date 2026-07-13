// ***************************************************************************
//
// TarotScore V2
//
// Fichier : bluestick_engine.dart
//
// Description : Moteur de calcul des BlueSticks.
//
// Auteur : David
//
// ***************************************************************************

import 'pipeline/bluestick_calculation.dart';
import 'rules/bluestick_rule.dart';

class BlueStickEngine {
  //--------------------------------------------------------------------------
  // Règles
  //--------------------------------------------------------------------------

  final List<BlueStickRule> _rules;

  //--------------------------------------------------------------------------
  // Constructeur
  //--------------------------------------------------------------------------

  BlueStickEngine({
    required Iterable<BlueStickRule> rules,
  }) : _rules = List.unmodifiable(rules);

  //--------------------------------------------------------------------------
  // Calcul
  //--------------------------------------------------------------------------

  /// Applique toutes les règles BlueStick au résultat du moteur.
  BlueStickCalculation calculate(
    BlueStickCalculation calculation,
  ) {
    var result = calculation;

    for (final rule in _rules) {
      result = rule.apply(result);
    }

    return result;
  }
}