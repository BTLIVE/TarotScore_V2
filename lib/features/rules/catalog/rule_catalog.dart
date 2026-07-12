// ***************************************************************************
//
// TarotScore V2
//
// Fichier : rule_catalog.dart
//
// Description : Catalogue complet des règles disponibles.
//
// Auteur : David
//
// ***************************************************************************

import '../models/bonus_rule.dart';
import '../models/contract_rule.dart';
import '../models/penalty_rule.dart';

class RuleCatalog {
  //---------------------------------------------------------------------------
  // Constructeur
  //---------------------------------------------------------------------------

  const RuleCatalog({
    required this.contracts,
    required this.bonuses,
    required this.penalties,
    required this.targetScores,
  });

  //---------------------------------------------------------------------------
  // Données
  //---------------------------------------------------------------------------

  final List<ContractRule> contracts;

  final List<BonusRule> bonuses;

  final List<PenaltyRule> penalties;

  final Map<int, int> targetScores;
}