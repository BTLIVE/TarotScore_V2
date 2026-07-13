// ***************************************************************************
//
// TarotScore V2
//
// Fichier : bluestick_service.dart
//
// Description : Service métier des BlueSticks.
//
// Auteur : David
//
// ***************************************************************************

import '../../rules/engine/pipeline/deal_calculation.dart';
import '../../sessions/models/session.dart';
import '../engine/pipeline/bluestick_calculation.dart';
import 'bluestick_calculation_service.dart';

class BlueStickService {
  //---------------------------------------------------------------------------
  // Dépendances
  //---------------------------------------------------------------------------

  final BlueStickCalculationService
      _calculationService;

  //---------------------------------------------------------------------------
  // Constructeur
  //---------------------------------------------------------------------------

  const BlueStickService({
    required BlueStickCalculationService
        calculationService,
  }) : _calculationService =
            calculationService;

  //---------------------------------------------------------------------------
  // Calcul
  //---------------------------------------------------------------------------

  BlueStickCalculation calculate({
    required Session session,
    required DealCalculation dealCalculation,
  }) {
    return _calculationService.calculate(
      session: session,
      dealCalculation: dealCalculation,
    );
  }
}