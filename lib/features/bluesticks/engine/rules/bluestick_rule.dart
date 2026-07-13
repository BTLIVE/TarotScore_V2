// ***************************************************************************
//
// TarotScore V2
//
// Fichier : bluestick_rule.dart
//
// Description : Interface d'une règle BlueStick.
//
// Auteur : David
//
// ***************************************************************************

import '../pipeline/bluestick_calculation.dart';

abstract class BlueStickRule {
  const BlueStickRule();

  //--------------------------------------------------------------------------
  // Calcul
  //--------------------------------------------------------------------------

  BlueStickCalculation apply(
    BlueStickCalculation calculation,
  );
}