// ***************************************************************************
//
// TarotScore V2
//
// Fichier : calculation_service.dart
//
// Description : Moteur de calcul des donnes.
//
// Auteur : David
//
// ***************************************************************************

import '../models/deal.dart';
import '../models/deal_result.dart';
import '../models/session_state.dart';

class CalculationService {
  CalculationService._();

  static final CalculationService instance =
      CalculationService._();

  //--------------------------------------------------------------------------
  // Calcul d'une donne
  //--------------------------------------------------------------------------

  DealResult calculate({
    required SessionState sessionState,
    required Deal deal,
  }) {
    throw UnimplementedError(
      'CalculationService.calculate() non implémenté.',
    );
  }
}