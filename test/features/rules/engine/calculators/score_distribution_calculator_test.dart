import 'package:flutter_test/flutter_test.dart';
import 'package:uuid/uuid.dart';

import 'package:tarotscore_v2/features/rules/engine/calculators/score_distribution_calculator.dart';
import 'package:tarotscore_v2/features/rules/engine/pipeline/deal_calculation.dart';
import 'package:tarotscore_v2/features/rules/factories/official_rule_profiles.dart';
import 'package:tarotscore_v2/features/sessions/models/deal.dart';

void main() {
  const calculator = ScoreDistributionCalculator();

  final profile = OfficialRuleProfiles.fft();

  DealCalculation createCalculation({
    required int playerCount,
    required int attacker,
    int? partner,
    bool hasCalledPartner = false,
    required int score,
  }) {
    final deal = Deal(
      uuid: const Uuid().v4(),
      number: 1,
      attackerPosition: attacker,
      hasCalledPartner: hasCalledPartner,
      partnerPosition: partner,
      contractId: 'garde',
      oudlers: 2,
      points: 41,
    );

    return DealCalculation(
      profile: profile,
      playerCount: playerCount,
      deal: deal,
      contractScore: score,
    );
  }

  group('ScoreDistributionCalculator', () {
    test('4 joueurs', () {
      final result = calculator.calculate(
        createCalculation(
          playerCount: 4,
          attacker: 0,
          score: 62,
        ),
      );

      expect(
        result.playerScores,
        equals({
          0: 186,
          1: -62,
          2: -62,
          3: -62,
        }),
      );
    });

    test('5 joueurs avec appelé', () {
      final result = calculator.calculate(
        createCalculation(
          playerCount: 5,
          attacker: 0,
          partner: 3,
          hasCalledPartner: true,
          score: 62,
        ),
      );

      expect(
        result.playerScores,
        equals({
          0: 124,
          1: -62,
          2: -62,
          3: 62,
          4: -62,
        }),
      );
    });

    test('5 joueurs preneur seul', () {
      final result = calculator.calculate(
        createCalculation(
          playerCount: 5,
          attacker: 1,
          score: 62,
        ),
      );

      expect(
        result.playerScores,
        equals({
          0: -62,
          1: 248,
          2: -62,
          3: -62,
          4: -62,
        }),
      );
    });

    test('Somme des scores égale à zéro', () {
      final result = calculator.calculate(
        createCalculation(
          playerCount: 5,
          attacker: 2,
          score: 84,
        ),
      );

      final total = result.playerScores!.values.fold(
        0,
        (sum, value) => sum + value,
      );

      expect(total, 0);
    });
  });
}