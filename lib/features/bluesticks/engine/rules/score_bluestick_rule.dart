// ***************************************************************************
//
// TarotScore V2
//
// Fichier : score_bluestick_rule.dart
//
// Description : Attribution des BlueSticks selon le score.
//
// Auteur : David
//
// ***************************************************************************

import '../../models/bluestick_event.dart';
import '../../models/bluestick_reason.dart';
import '../pipeline/bluestick_calculation.dart';
import 'bluestick_rule.dart';

class ScoreBlueStickRule implements BlueStickRule {
  //--------------------------------------------------------------------------
  // Constructeur
  //--------------------------------------------------------------------------

  const ScoreBlueStickRule();

  //--------------------------------------------------------------------------
  // Calcul
  //--------------------------------------------------------------------------

  @override
  BlueStickCalculation apply(
    BlueStickCalculation calculation,
  ) {
    final finalScore =
        calculation.dealCalculation.finalScore;

    if (finalScore == null) {
      return calculation;
    }

    //-----------------------------------------------------------------------
    // Aucune BlueStick si le score est supérieur à -500.
    //-----------------------------------------------------------------------

    if (finalScore > -500) {
      return calculation;
    }

    //-----------------------------------------------------------------------
    // Une BlueStick par tranche complète de 500 points.
    //-----------------------------------------------------------------------

    final quantity =
        (-finalScore) ~/ 500;

    if (quantity <= 0) {
      return calculation;
    }

    final event = BlueStickEvent(
      id: '',
      sessionId:
          calculation.context.session.uuid,
      dealId:
          calculation.dealCalculation.deal.uuid,

      // TODO :
      // Associer plus tard l'UUID réel du joueur.
      playerId:
          calculation.dealCalculation.deal.attackerPosition.toString(),

      reason: BlueStickReason.score,
      quantity: quantity,
    );

    return calculation.copyWith(
      events: [
        ...calculation.events,
        event,
      ],
    );
  }
}