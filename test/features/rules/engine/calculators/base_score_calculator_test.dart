import 'package:flutter_test/flutter_test.dart';
import 'package:uuid/uuid.dart';

import 'package:tarotscore_v2/features/rules/engine/calculators/base_score_calculator.dart';
import 'package:tarotscore_v2/features/rules/engine/pipeline/deal_calculation.dart';
import 'package:tarotscore_v2/features/rules/engine/pipeline/deal_context.dart';
import 'package:tarotscore_v2/features/rules/factories/official_rule_profiles.dart';
import 'package:tarotscore_v2/features/sessions/models/deal.dart';

void main() {
  const calculator = BaseScoreCalculator();

  final profile = OfficialRuleProfiles.fft();

  DealCalculation createCalculation({
    required int oudlers,
    required double points,
  }) {
    final deal = Deal(
      uuid: const Uuid().v4(),
      number: 1,
      attackerPosition: 0,
      contractId: 'garde',
      oudlers: oudlers,
      points: points,
    );

    return DealCalculation(
      profile: profile,
      context: const DealContext(
        activePlayerPositions: [
          0,
          1,
          2,
          3,
        ],
        deadPlayerPositions: [],
        dealerPosition: 0,
      ),
      deal: deal,
    );
  }

  group('BaseScoreCalculator', () {
    test('Won by 5 points', () {
      final result = calculator.calculate(
        createCalculation(
          oudlers: 2,
          points: 46,
        ),
      );

      expect(result.success, isTrue);
      expect(result.baseScore, 30);
    });

    test('Lost by 5 points', () {
      final result = calculator.calculate(
        createCalculation(
          oudlers: 2,
          points: 36,
        ),
      );

      expect(result.success, isFalse);
      expect(result.baseScore, 30);
    });

    test('Exactly target score', () {
      final result = calculator.calculate(
        createCalculation(
          oudlers: 2,
          points: 41,
        ),
      );

      expect(result.success, isTrue);
      expect(result.baseScore, 25);
    });

    test('Target with 0 oudlers', () {
      final result = calculator.calculate(
        createCalculation(
          oudlers: 0,
          points: 56,
        ),
      );

      expect(result.success, isTrue);
      expect(result.baseScore, 25);
    });

    test('Target with 3 oudlers', () {
      final result = calculator.calculate(
        createCalculation(
          oudlers: 3,
          points: 36,
        ),
      );

      expect(result.success, isTrue);
      expect(result.baseScore, 25);
    });
  });
}