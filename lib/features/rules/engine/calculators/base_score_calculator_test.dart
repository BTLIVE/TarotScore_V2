import 'package:flutter_test/flutter_test.dart';

import 'package:tarotscore_v2/features/rules/engine/calculators/base_score_calculator.dart';

void main() {
  group('BaseScoreCalculator', () {
    const calculator = BaseScoreCalculator();

    test('Won by 5 points', () {
      final result = calculator.calculate(
        targetScore: 41,
        pointsMade: 46,
      );

      expect(result.success, true);
      expect(result.value, 30);
    });

    test('Lost by 5 points', () {
      final result = calculator.calculate(
        targetScore: 41,
        pointsMade: 36,
      );

      expect(result.success, false);
      expect(result.value, 30);
    });

    test('Exactly target score', () {
      final result = calculator.calculate(
        targetScore: 41,
        pointsMade: 41,
      );

      expect(result.success, true);
      expect(result.value, 25);
    });
  });
}