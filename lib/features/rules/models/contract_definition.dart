// ***************************************************************************
//
// TarotScore V2
//
// Fichier : contract_definition.dart
//
// Description : Définition d'un contrat.
//
// Auteur : David
//
// ***************************************************************************

import 'rule_definition.dart';

class ContractDefinition
    extends RuleDefinition {
  //---------------------------------------------------------------------------
  // Valeurs
  //---------------------------------------------------------------------------

  /// Multiplicateur proposé.
  final int defaultMultiplier;

  //---------------------------------------------------------------------------
  // Construction
  //---------------------------------------------------------------------------

  const ContractDefinition({
    required super.id,
    required super.name,
    required super.description,
    required this.defaultMultiplier,
  });
}