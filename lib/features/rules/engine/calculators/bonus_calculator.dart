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

import '../../../sessions/models/applied_bonus.dart';
import '../pipeline/deal_calculation.dart';
import 'calculator.dart';

class BonusCalculator implements Calculator {
  const BonusCalculator();

  //--------------------------------------------------------------------------
  // Calcul
  //--------------------------------------------------------------------------

  @override
  DealCalculation calculate(
    DealCalculation calculation,
  ) {
    final appliedBonuses =
        <AppliedBonus>[];

    var totalBonus = 0;

    //----------------------------------------------------------------------
    // Application des bonus
    //----------------------------------------------------------------------

    for (final event
        in calculation.deal.events) {
      final rule =
          calculation.profile.bonus(
        event.id,
      );

      if (rule == null) {
        continue;
      }

      appliedBonuses.add(
        AppliedBonus(
          id: rule.id,
          typeId: rule.typeId,
          name: rule.name,
          value: rule.value,
        ),
      );

      totalBonus += rule.value;
    }

    //----------------------------------------------------------------------
    // Résultat
    //----------------------------------------------------------------------

    return calculation.copyWith(
      appliedBonuses: appliedBonuses,
      bonusPoints: totalBonus,
    );
  }
}