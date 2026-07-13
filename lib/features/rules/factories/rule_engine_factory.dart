// ***************************************************************************
//
// TarotScore V2
//
// Fichier : rule_engine_factory.dart
//
// Description : Fabrique de RuleEngine.
//
// Auteur : David
//
// ***************************************************************************

import '../engine/calculators/bonus_calculator.dart';
import '../engine/calculators/contract_points_calculator.dart';
import '../engine/calculators/difference_calculator.dart';
import '../engine/calculators/difference_points_calculator.dart';
import '../engine/calculators/difference_rounding_calculator.dart';
import '../engine/calculators/final_score_calculator.dart';
import '../engine/calculators/score_distribution_calculator.dart';
import '../engine/calculators/target_calculator.dart';
import '../engine/calculators/validation_calculator.dart';
import '../engine/rule_engine.dart';

class RuleEngineFactory {
  const RuleEngineFactory._();

  static RuleEngine create() {
    return RuleEngine(
      calculators: const [
        TargetCalculator(),

        DifferenceCalculator(),

        DifferenceRoundingCalculator(),

        ContractPointsCalculator(),

        DifferencePointsCalculator(),

        // Préparation des futurs bonus.
        BonusCalculator(),

        FinalScoreCalculator(),

        ScoreDistributionCalculator(),

        ValidationCalculator(),
      ],
    );
  }
}