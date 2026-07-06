import 'package:flutter_test/flutter_test.dart';
import 'package:uuid/uuid.dart';

import 'package:tarotscore_v2/features/rules/engine/calculators/validation_calculator.dart';
import 'package:tarotscore_v2/features/rules/engine/exceptions/invalid_deal_exception.dart';
import 'package:tarotscore_v2/features/rules/engine/pipeline/deal_calculation.dart';
import 'package:tarotscore_v2/features/rules/factories/official_rule_profiles.dart';
import 'package:tarotscore_v2/features/sessions/models/deal.dart';

void main() {
  const calculator = ValidationCalculator();

  final profile = OfficialRuleProfiles.fft();

  DealCalculation createCalculation({
    String contractId = 'garde',
    int oudlers = 2,
    double points = 46,
    int playerCount = 4,
    bool hasCalledPartner = false,
    int? partnerPosition,
  }) {
    final deal = Deal(
      uuid: const Uuid().v4(),
      number: 1,
      attackerPosition: 0,
      hasCalledPartner: hasCalledPartner,
      partnerPosition: partnerPosition,
      contractId: contractId,
      oudlers: oudlers,
      points: points,
    );

    return DealCalculation(
      profile: profile,
      playerCount: playerCount,
      deal: deal,
    );
  }

  group('ValidationCalculator', () {
    test('Valid deal (4 players)', () {
      expect(
        () => calculator.calculate(
          createCalculation(),
        ),
        returnsNormally,
      );
    });

    test('Valid deal (5 players with partner)', () {
      expect(
        () => calculator.calculate(
          createCalculation(
            playerCount: 5,
            hasCalledPartner: true,
            partnerPosition: 2,
          ),
        ),
        returnsNormally,
      );
    });

    test('Valid deal (5 players alone)', () {
      expect(
        () => calculator.calculate(
          createCalculation(
            playerCount: 5,
          ),
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
        throwsA(isA<InvalidDealException>()),
      );
    });

    test('Invalid oudlers', () {
      expect(
        () => calculator.calculate(
          createCalculation(
            oudlers: 4,
          ),
        ),
        throwsA(isA<InvalidDealException>()),
      );
    });

    test('Invalid points', () {
      expect(
        () => calculator.calculate(
          createCalculation(
            points: 120,
          ),
        ),
        throwsA(isA<InvalidDealException>()),
      );
    });

    test('Partner required at 5 players', () {
      expect(
        () => calculator.calculate(
          createCalculation(
            playerCount: 5,
            hasCalledPartner: true,
          ),
        ),
        throwsA(isA<InvalidDealException>()),
      );
    });

    test('Partner forbidden at 4 players', () {
      expect(
        () => calculator.calculate(
          createCalculation(
            hasCalledPartner: true,
            partnerPosition: 1,
          ),
        ),
        throwsA(isA<InvalidDealException>()),
      );
    });

    test('Partner cannot be attacker', () {
      expect(
        () => calculator.calculate(
          createCalculation(
            playerCount: 5,
            hasCalledPartner: true,
            partnerPosition: 0,
          ),
        ),
        throwsA(isA<InvalidDealException>()),
      );
    });
  });
}