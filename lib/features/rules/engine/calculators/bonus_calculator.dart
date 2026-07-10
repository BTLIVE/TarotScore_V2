// ***************************************************************************
//
// TarotScore V2
//
// Fichier : bonus_calculator.dart
//
// Description : Application des bonus d'une donne.
//
// Auteur : David
//
// ***************************************************************************

import '../pipeline/deal_calculation.dart';
import 'calculator.dart';

class BonusCalculator implements Calculator {
  const BonusCalculator();

  @override
  DealCalculation calculate(
    DealCalculation calculation,
  ) {
    // Aucun bonus appliqué pour le moment.
    // Le score final reste identique au score contrat.

    return calculation;
  }
}