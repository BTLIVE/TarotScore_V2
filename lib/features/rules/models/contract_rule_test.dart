import 'package:flutter_test/flutter_test.dart';

import 'package:tarotscore_v2/features/rules/models/contract_rule.dart';

void main() {
  group('ContractRule', () {
    test('copyWith', () {
      const contract = ContractRule(
        id: 'garde',
        name: 'Garde',
        multiplier: 2,
        order: 2,
      );

      final copy = contract.copyWith(
        multiplier: 4,
      );

      expect(copy.multiplier, 4);
      expect(copy.name, 'Garde');
      expect(copy.id, 'garde');
    });

    test('toMap/fromMap', () {
      const contract = ContractRule(
        id: 'petite',
        name: 'Petite',
        multiplier: 1,
        order: 1,
      );

      final map = contract.toMap();

      final restored = ContractRule.fromMap(map);

      expect(restored, contract);
    });
  });
}