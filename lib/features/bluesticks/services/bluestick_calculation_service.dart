// ***************************************************************************
//
// TarotScore V2
//
// Fichier : bluestick_calculation_service.dart
//
// Description : Orchestration du calcul des BlueSticks.
//
// Auteur : David
//
// ***************************************************************************

import '../../rules/engine/pipeline/deal_calculation.dart';
import '../../sessions/models/session.dart';

import '../engine/bluestick_engine.dart';
import '../engine/pipeline/bluestick_calculation.dart';
import '../engine/pipeline/bluestick_context.dart';

class BlueStickCalculationService {
  //--------------------------------------------------------------------------
  // Dépendances
  //--------------------------------------------------------------------------

  final BlueStickEngine engine;

  //--------------------------------------------------------------------------
  // Constructeur
  //--------------------------------------------------------------------------

  const BlueStickCalculationService({
    required this.engine,
  });

  //--------------------------------------------------------------------------
  // Calcul
  //--------------------------------------------------------------------------

  BlueStickCalculation calculate({
    required Session session,
    required DealCalculation dealCalculation,
  }) {
    final calculation = BlueStickCalculation(
      dealCalculation: dealCalculation,
      context: BlueStickContext(
        session: session,
      ),
    );

    return engine.calculate(
      calculation,
    );
  }
}