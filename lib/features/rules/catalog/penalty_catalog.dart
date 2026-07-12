// ***************************************************************************
//
// TarotScore V2
//
// Fichier : penalty_catalog.dart
//
// Description : Catalogue des pénalités disponibles.
//
// Auteur : David
//
// ***************************************************************************

import '../models/penalty_definition.dart';

class PenaltyCatalog {
  const PenaltyCatalog._();

  //---------------------------------------------------------------------------
  // Catalogue
  //---------------------------------------------------------------------------

  static const penalties = [
    PenaltyDefinition(
      id: 'penalty.false_deal',
      name: 'Fausse donne',
      description:
          'Annulation de la donne et application de la pénalité prévue.',
      defaultValue: 0,
    ),

    PenaltyDefinition(
      id: 'penalty.abandon',
      name: 'Abandon',
      description:
          'Pénalité appliquée en cas d\'abandon de la partie.',
      defaultValue: 0,
    ),

    PenaltyDefinition(
      id: 'penalty.time_limit',
      name: 'Dépassement du temps',
      description:
          'Pénalité appliquée lorsqu\'un temps limite est dépassé.',
      defaultValue: 0,
    ),

    PenaltyDefinition(
      id: 'penalty.invalid_announcement',
      name: 'Annonce invalide',
      description:
          'Annonce non conforme au règlement.',
      defaultValue: 0,
    ),
  ];

  //---------------------------------------------------------------------------
  // Recherche
  //---------------------------------------------------------------------------

  static PenaltyDefinition? byId(
    String id,
  ) {
    for (final penalty in penalties) {
      if (penalty.id == id) {
        return penalty;
      }
    }

    return null;
  }

  //---------------------------------------------------------------------------
  // Identifiants
  //---------------------------------------------------------------------------

  static List<String> get ids =>
      penalties
          .map((penalty) => penalty.id)
          .toList(growable: false);
}