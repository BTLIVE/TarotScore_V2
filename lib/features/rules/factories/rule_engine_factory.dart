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

import '../engine/calculators/base_score_calculator.dart';
import '../engine/calculators/contract_multiplier_calculator.dart';
import '../engine/calculators/score_distribution_calculator.dart';
import '../engine/calculators/validation_calculator.dart';
import '../engine/rule_engine.dart';

class RuleEngineFactory {
  const RuleEngineFactory._();

  static RuleEngine create() {
    return RuleEngine(
      calculators: const [
        ValidationCalculator(),
        BaseScoreCalculator(),
        ContractMultiplierCalculator(),
        ScoreDistributionCalculator(),
      ],
    );
  }
}