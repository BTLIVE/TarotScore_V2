// ***************************************************************************
//
// TarotScore V2
//
// Fichier : rule_definition.dart
//
// Description : Classe de base des définitions de règles.
//
// Auteur : David
//
// ***************************************************************************

abstract class RuleDefinition {
  //---------------------------------------------------------------------------
  // Identification
  //---------------------------------------------------------------------------

  /// Identifiant unique.
  final String id;

  /// Nom affiché.
  final String name;

  /// Description.
  final String description;

  //---------------------------------------------------------------------------
  // Construction
  //---------------------------------------------------------------------------

  const RuleDefinition({
    required this.id,
    required this.name,
    required this.description,
  });
}