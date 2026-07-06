// ***************************************************************************
// TarotScore V2
//
// Fichier : base_score_calculator.dart
//
// Description : Calcul du score de base.
//
// Auteur : David
// ***************************************************************************

import '../value_objects/base_score.dart';

class BaseScoreCalculator {
  const BaseScoreCalculator();

  BaseScore calculate({
    required int targetScore,
    required int pointsMade,
  }) {
    final difference = pointsMade - targetScore;

    return BaseScore(
      success: difference >= 0,
      value: 25 + difference.abs(),
    );
  }
}