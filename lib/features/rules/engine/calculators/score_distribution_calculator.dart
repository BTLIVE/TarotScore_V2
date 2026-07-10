// ***************************************************************************
// TarotScore V2
//
// Fichier : score_distribution_calculator.dart
//
// Description : Répartition du score entre les joueurs.
//
// Auteur : David
// ***************************************************************************

import 'package:flutter/foundation.dart';

import '../exceptions/invalid_deal_exception.dart';
import '../pipeline/deal_calculation.dart';
import 'calculator.dart';

class ScoreDistributionCalculator
    implements Calculator {
  const ScoreDistributionCalculator();

  @override
  DealCalculation calculate(
    DealCalculation calculation,
  ) {
    debugPrint('----------------------------------------');
    debugPrint('ScoreDistributionCalculator');
    debugPrint(
      'playerCount = ${calculation.playerCount}',
    );
    debugPrint(
      'activePlayers = ${calculation.context.activePlayerPositions}',
    );
    debugPrint(
      'dealer = ${calculation.context.dealerPosition}',
    );
    debugPrint(
      'attacker = ${calculation.deal.attackerPosition}',
    );
    debugPrint(
      'partner = ${calculation.deal.partnerPosition}',
    );

    final deal = calculation.deal;
    final score = calculation.finalScore;

    if (score == null) {
      throw InvalidDealException(
        'Le score final n\'est pas calculé.',
      );
    }

    switch (calculation.playerCount) {
      case 4:
        return _fourPlayers(
          calculation,
          score,
        );

      case 5:
        if (deal.hasCalledPartner) {
          return _fivePlayersWithPartner(
            calculation,
            score,
          );
        }

        return _fivePlayersAlone(
          calculation,
          score,
        );

      default:
        throw InvalidDealException(
          'Nombre de joueurs non supporté.',
        );
    }
  }

  //--------------------------------------------------------------------------
  // Création des scores de défense
  //--------------------------------------------------------------------------

  Map<int, int> _createDefenseScores(
    DealCalculation calculation,
    int score,
  ) {
    final scores = <int, int>{};

    for (final position
        in calculation.context.activePlayerPositions) {
      scores[position] = -score;
    }

    debugPrint(
      'Défense : $scores',
    );

    return scores;
  }

  //--------------------------------------------------------------------------
  // 4 joueurs
  //--------------------------------------------------------------------------

  DealCalculation _fourPlayers(
    DealCalculation calculation,
    int score,
  ) {
    final scores =
        _createDefenseScores(
      calculation,
      score,
    );

    scores[calculation.deal.attackerPosition] =
        score * 3;

    debugPrint(
      'Scores finaux : $scores',
    );

    _checkBalance(scores);

    return calculation.copyWith(
      playerScores: scores,
    );
  }

  //--------------------------------------------------------------------------
  // 5 joueurs avec appelé
  //--------------------------------------------------------------------------

  DealCalculation _fivePlayersWithPartner(
    DealCalculation calculation,
    int score,
  ) {
    final partner =
        calculation.deal.partnerPosition;

    if (partner == null) {
      throw InvalidDealException(
        'Le partenaire est obligatoire.',
      );
    }

    if (partner ==
        calculation.deal.attackerPosition) {
      throw InvalidDealException(
        'Le partenaire ne peut pas être le preneur.',
      );
    }

    final scores =
        _createDefenseScores(
      calculation,
      score,
    );

    scores[calculation.deal.attackerPosition] =
        score * 2;

    scores[partner] = score;

    debugPrint(
      'Scores finaux : $scores',
    );

    _checkBalance(scores);

    return calculation.copyWith(
      playerScores: scores,
    );
  }

  //--------------------------------------------------------------------------
  // 5 joueurs, preneur seul
  //--------------------------------------------------------------------------

  DealCalculation _fivePlayersAlone(
    DealCalculation calculation,
    int score,
  ) {
    final scores =
        _createDefenseScores(
      calculation,
      score,
    );

    scores[calculation.deal.attackerPosition] =
        score * 4;

    debugPrint(
      'Scores finaux : $scores',
    );

    _checkBalance(scores);

    return calculation.copyWith(
      playerScores: scores,
    );
  }

  //--------------------------------------------------------------------------
  // Vérification
  //--------------------------------------------------------------------------

  void _checkBalance(
    Map<int, int> scores,
  ) {
    final total = scores.values.fold(
      0,
      (sum, value) => sum + value,
    );

    debugPrint(
      'Somme = $total',
    );

    if (total != 0) {
      throw InvalidDealException(
        'La somme des scores doit être égale à zéro.',
      );
    }
  }
}