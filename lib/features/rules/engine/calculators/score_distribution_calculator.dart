// ***************************************************************************
// TarotScore V2
//
// Fichier : score_distribution_calculator.dart
//
// Description : Répartition du score entre les joueurs.
//
// Auteur : David
// ***************************************************************************

import '../exceptions/invalid_deal_exception.dart';
import '../pipeline/deal_calculation.dart';
import 'calculator.dart';

class ScoreDistributionCalculator implements Calculator {
  const ScoreDistributionCalculator();

  @override
  DealCalculation calculate(
    DealCalculation calculation,
  ) {
    final deal = calculation.deal;
    final score = calculation.contractScore;

    if (score == null) {
      throw InvalidDealException(
        'Le score du contrat n\'est pas calculé.',
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
  // 4 joueurs
  //--------------------------------------------------------------------------

  DealCalculation _fourPlayers(
    DealCalculation calculation,
    int score,
  ) {
    final scores = <int, int>{};

    for (var i = 0; i < 4; i++) {
      scores[i] = -score;
    }

    scores[calculation.deal.attackerPosition] = score * 3;

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
    final partner = calculation.deal.partnerPosition;

    if (partner == null) {
      throw InvalidDealException(
        'Le partenaire est obligatoire.',
      );
    }

    if (partner == calculation.deal.attackerPosition) {
      throw InvalidDealException(
        'Le partenaire ne peut pas être le preneur.',
      );
    }

    final scores = <int, int>{};

    for (var i = 0; i < 5; i++) {
      scores[i] = -score;
    }

    scores[calculation.deal.attackerPosition] = score * 2;
    scores[partner] = score;

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
    final scores = <int, int>{};

    for (var i = 0; i < 5; i++) {
      scores[i] = -score;
    }

    scores[calculation.deal.attackerPosition] = score * 4;

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

    if (total != 0) {
      throw InvalidDealException(
        'La somme des scores doit être égale à zéro.',
      );
    }
  }
}