// ***************************************************************************
//
// TarotScore V2
//
// Fichier : bonus_definition.dart
//
// Description : Définition d'un bonus.
//
// Auteur : David
//
// ***************************************************************************

import 'rule_definition.dart';

class BonusDefinition
    extends RuleDefinition {
  //---------------------------------------------------------------------------
  // Valeur
  //---------------------------------------------------------------------------

  final int defaultValue;

  //---------------------------------------------------------------------------
  // Construction
  //---------------------------------------------------------------------------

  const BonusDefinition({
    required super.id,
    required super.name,
    required super.description,
    required this.defaultValue,
  });
}