import 'package:flutter_test/flutter_test.dart';

import 'package:tarotscore_v2/features/rules/factories/official_rule_profiles.dart';

void main() {
  group('Official FFT profile', () {
    final profile = OfficialRuleProfiles.fft();

    //-----------------------------------------------------------------------
    // Informations générales
    //-----------------------------------------------------------------------

    test('Profile name', () {
      expect(profile.name, 'FFT Officielle');
    });

    test('Profile is official', () {
      expect(profile.official, true);
    });

    //-----------------------------------------------------------------------
    // Contenu
    //-----------------------------------------------------------------------

    test('Contains 4 contracts', () {
      expect(profile.contracts.length, 4);
    });

    test('Contains 4 bonus rules', () {
      expect(profile.bonuses.length, 4);
    });

    test('Contains 4 target scores', () {
      expect(profile.targetScores.length, 4);
    });

    //-----------------------------------------------------------------------
    // Recherche
    //-----------------------------------------------------------------------

    test('Find contract', () {
      final contract = profile.contract('garde');

      expect(contract, isNotNull);
      expect(contract!.name, 'Garde');
      expect(contract.multiplier, 2);
    });

    test('Find unknown contract', () {
      expect(
        profile.contract('inconnu'),
        isNull,
      );
    });

    test('Find bonus', () {
      final bonus = profile.bonus('petit');

      expect(bonus, isNotNull);
      expect(bonus!.name, 'Petit au bout');
      expect(bonus.value, 10);
    });

    test('Find unknown bonus', () {
      expect(
        profile.bonus('inconnu'),
        isNull,
      );
    });

    //-----------------------------------------------------------------------
    // Scores cibles
    //-----------------------------------------------------------------------

    test('Target scores', () {
      expect(profile.targetScore(0), 56);
      expect(profile.targetScore(1), 51);
      expect(profile.targetScore(2), 41);
      expect(profile.targetScore(3), 36);
    });

    test('Invalid target score', () {
      expect(
        profile.targetScore(4),
        isNull,
      );
    });

    //-----------------------------------------------------------------------
    // Contrats et bonus actifs
    //-----------------------------------------------------------------------

    test('Enabled contracts', () {
      expect(
        profile.enabledContracts.length,
        4,
      );
    });

    test('Enabled bonuses', () {
      expect(
        profile.enabledBonuses.length,
        4,
      );
    });
  });
}