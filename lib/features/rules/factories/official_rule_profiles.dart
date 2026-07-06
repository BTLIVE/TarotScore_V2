// ***************************************************************************
// TarotScore V2
//
// Fichier : official_rule_profiles.dart
//
// Description : Profils officiels fournis par TarotScore.
//
// Auteur : David
// ***************************************************************************

import 'package:uuid/uuid.dart';

import '../models/bonus_rule.dart';
import '../models/contract_rule.dart';
import '../models/rule_profile.dart';

class OfficialRuleProfiles {
  OfficialRuleProfiles._();

  static final Uuid _uuid = const Uuid();

  //--------------------------------------------------------------------------
  // FFT officielle
  //--------------------------------------------------------------------------

  static RuleProfile fft() {
    return RuleProfile(
      uuid: _uuid.v4(),

      name: 'FFT Officielle',

      description:
          'Règlement officiel de la Fédération Française de Tarot.',

      version: '2025',

      official: true,

      contracts: const [
        ContractRule(
          id: 'petite',
          name: 'Petite',
          multiplier: 1,
          order: 1,
        ),
        ContractRule(
          id: 'garde',
          name: 'Garde',
          multiplier: 2,
          order: 2,
        ),
        ContractRule(
          id: 'garde_sans',
          name: 'Garde Sans',
          multiplier: 4,
          order: 3,
        ),
        ContractRule(
          id: 'garde_contre',
          name: 'Garde Contre',
          multiplier: 6,
          order: 4,
        ),
      ],

      bonuses: const [
        BonusRule(
          id: 'petit',
          name: 'Petit au bout',
          typeId: 'petit',
          value: 10,
          order: 1,
        ),
        BonusRule(
          id: 'poignee_simple',
          name: 'Poignée simple',
          typeId: 'poignee',
          value: 20,
          order: 2,
        ),
        BonusRule(
          id: 'poignee_double',
          name: 'Double poignée',
          typeId: 'poignee',
          value: 30,
          order: 3,
        ),
        BonusRule(
          id: 'poignee_triple',
          name: 'Triple poignée',
          typeId: 'poignee',
          value: 40,
          order: 4,
        ),
      ],

      targetScores: const {
        0: 56,
        1: 51,
        2: 41,
        3: 36,
      },
    );
  }
}