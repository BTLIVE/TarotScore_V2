// ***************************************************************************
//
// TarotScore V2
//
// Fichier : default_rule_catalog.dart
//
// Description : Catalogue de base des règles fournies par TarotScore.
//
// Auteur : David
//
// ***************************************************************************

import '../models/bonus_rule.dart';
import '../models/contract_rule.dart';
import '../models/penalty_rule.dart';
import 'rule_catalog.dart';

class DefaultRuleCatalog {
  DefaultRuleCatalog._();

  //---------------------------------------------------------------------------
  // Catalogue par défaut
  //---------------------------------------------------------------------------

  static const RuleCatalog catalog = RuleCatalog(
    //-----------------------------------------------------------------------
    // Contrats
    //-----------------------------------------------------------------------

    contracts: [
      ContractRule(
        id: 'petite',
        name: 'Petite',
        multiplier: 1,
        order: 1,
      ),
      ContractRule(
        id: 'pousse',
        name: 'Pousse',
        multiplier: 2,
        order: 2,
      ),
      ContractRule(
        id: 'garde',
        name: 'Garde',
        multiplier: 4,
        order: 3,
      ),
      ContractRule(
        id: 'garde_sans',
        name: 'Garde Sans',
        multiplier: 6,
        order: 4,
      ),
      ContractRule(
        id: 'garde_contre',
        name: 'Garde Contre',
        multiplier: 8,
        order: 5,
      ),
    ],

    //-----------------------------------------------------------------------
    // Bonus
    //-----------------------------------------------------------------------

    bonuses: [
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

    //-----------------------------------------------------------------------
    // Pénalités
    //-----------------------------------------------------------------------

    penalties: [
      PenaltyRule(
        id: 'poignee_non_presentee',
        name: 'Poignée non présentée',
        value: 20,
        order: 1,
      ),
      PenaltyRule(
        id: 'chelem_annonce_perdu',
        name: 'Chelem annoncé perdu',
        value: 200,
        order: 2,
      ),
    ],

    //-----------------------------------------------------------------------
    // Objectifs
    //-----------------------------------------------------------------------

    targetScores: {
      0: 56,
      1: 51,
      2: 41,
      3: 36,
    },
  );
}