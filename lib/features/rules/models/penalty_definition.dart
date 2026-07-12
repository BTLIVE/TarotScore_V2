// ***************************************************************************
//
// TarotScore V2
//
// Fichier : penalty_definition.dart
//
// Description : Définition d'une pénalité.
//
// Auteur : David
//
// ***************************************************************************

import 'rule_definition.dart';

class PenaltyDefinition
    extends RuleDefinition {
  //---------------------------------------------------------------------------
  // Valeur
  //---------------------------------------------------------------------------

  final int defaultValue;

  //---------------------------------------------------------------------------
  // Construction
  //---------------------------------------------------------------------------

  const PenaltyDefinition({
    required super.id,
    required super.name,
    required super.description,
    required this.defaultValue,
  });
}