import 'package:flutter_test/flutter_test.dart';

import 'package:tarotscore_v2/features/rules/models/bonus_rule.dart';

void main() {
  group('BonusRule', () {
    test('copyWith', () {
      const bonus = BonusRule(
        id: 'petit',
        name: 'Petit',
        typeId: 'petit',
        value: 10,
        order: 1,
      );

      final copy = bonus.copyWith(
        value: 20,
      );

      expect(copy.value, 20);
      expect(copy.id, 'petit');
    });

    test('toMap/fromMap', () {
      const bonus = BonusRule(
        id: 'petit',
        name: 'Petit',
        typeId: 'petit',
        value: 10,
        order: 1,
      );

      final map = bonus.toMap();

      final restored = BonusRule.fromMap(map);

      expect(restored, bonus);
    });
  });
}