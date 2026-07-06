// ***************************************************************************
// TarotScore V2
//
// Fichier : calculator.dart
//
// Description : Interface commune des calculateurs.
//
// Auteur : David
// ***************************************************************************

import '../pipeline/deal_calculation.dart';

abstract interface class Calculator {
  DealCalculation calculate(DealCalculation calculation);
}