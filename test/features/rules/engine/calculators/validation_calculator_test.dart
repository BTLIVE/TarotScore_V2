import 'package:flutter_test/flutter_test.dart';
import 'package:uuid/uuid.dart';

import 'package:tarotscore_v2/features/players/models/player.dart';
import 'package:tarotscore_v2/features/rules/engine/calculators/validation_calculator.dart';
import 'package:tarotscore_v2/features/rules/engine/exceptions/invalid_deal_exception.dart';
import 'package:tarotscore_v2/features/rules/engine/pipeline/deal_calculation.dart';
import 'package:tarotscore_v2/features/rules/factories/official_rule_profiles.dart';
import 'package:tarotscore_v2/features/sessions/models/deal.dart';
import 'package:tarotscore_v2/features/sessions/models/session.dart';

void main() {
  const calculator = ValidationCalculator();

  final profile = OfficialRuleProfiles.fft();

  final session = Session(
    uuid: const Uuid().v4(),
    ruleProfile: profile,
    players: const <Player>[],
  );

  DealCalculation createCalculation({
    String contractId = 'garde',
    int oudlers = 2,
    double points = 46,
  }) {
    final deal = Deal(
      uuid: const Uuid().v4(),
      number: 1,
      attackerPosition: 0,
      contractId: contractId,
      oudlers: oudlers,
      points: points,
    );

    return DealCalculation(
      session: session,
      deal: deal,
    );
  }

  group('ValidationCalculator', () {
    test('Valid deal', () {
      expect(
        () => calculator.calculate(
          createCalculation(),
        ),
        returnsNormally,
      );
    });

    test('Invalid contract', () {
      expect(
        () => calculator.calculate(
          createCalculation(
            contractId: 'super_garde',
          ),
        ),
        throwsA(
          isA<InvalidDealException>(),
        ),
      );
    });

    test('Invalid oudlers', () {
      expect(
        () => calculator.calculate(
          createCalculation(
            oudlers: 4,
          ),
        ),
        throwsA(
          isA<InvalidDealException>(),
        ),
      );
    });

    test('Invalid points', () {
      expect(
        () => calculator.calculate(
          createCalculation(
            points: 120,
          ),
        ),
        throwsA(
          isA<InvalidDealException>(),
        ),
      );
    });
  });
}