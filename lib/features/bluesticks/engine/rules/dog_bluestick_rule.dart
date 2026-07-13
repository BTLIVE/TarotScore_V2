// ***************************************************************************
//
// TarotScore V2
//
// Fichier : dog_bluestick_rule.dart
//
// Description : Attribution des BlueSticks liées au chien.
//
// Auteur : David
//
// ***************************************************************************

import '../pipeline/bluestick_calculation.dart';
import 'bluestick_rule.dart';

class DogBlueStickRule implements BlueStickRule {
  const DogBlueStickRule();

  @override
  BlueStickCalculation apply(
    BlueStickCalculation calculation,
  ) {
    return calculation;
  }
}