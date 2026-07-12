// ***************************************************************************
//
// TarotScore V2
//
// Fichier : bonus_catalog.dart
//
// Description : Catalogue des bonus disponibles.
//
// Auteur : David
//
// ***************************************************************************

import '../models/bonus_definition.dart';

class BonusCatalog {
  const BonusCatalog._();

  //---------------------------------------------------------------------------
  // Catalogue
  //---------------------------------------------------------------------------

  static const bonuses = [
    BonusDefinition(
      id: 'bonus.petit_au_bout',
      name: 'Petit au bout',
      description:
          'Bonus accordé lorsque le Petit est joué à la dernière levée.',
      defaultValue: 10,
    ),

    BonusDefinition(
      id: 'bonus.petit_au_bout_annonce',
      name: 'Petit au bout annoncé',
      description:
          'Bonus du Petit au bout annoncé.',
      defaultValue: 20,
    ),

    BonusDefinition(
      id: 'bonus.poignee',
      name: 'Poignée',
      description:
          'Annonce d\'une poignée.',
      defaultValue: 20,
    ),

    BonusDefinition(
      id: 'bonus.double_poignee',
      name: 'Double poignée',
      description:
          'Annonce d\'une double poignée.',
      defaultValue: 30,
    ),

    BonusDefinition(
      id: 'bonus.triple_poignee',
      name: 'Triple poignée',
      description:
          'Annonce d\'une triple poignée.',
      defaultValue: 40,
    ),

    BonusDefinition(
      id: 'bonus.chelem',
      name: 'Chelem',
      description:
          'Chelem réalisé.',
      defaultValue: 200,
    ),

    BonusDefinition(
      id: 'bonus.chelem_annonce',
      name: 'Chelem annoncé',
      description:
          'Chelem annoncé puis réalisé.',
      defaultValue: 400,
    ),

    BonusDefinition(
      id: 'bonus.misere_tete',
      name: 'Misère de tête',
      description:
          'Annonce d\'une misère de tête.',
      defaultValue: 10,
    ),

    BonusDefinition(
      id: 'bonus.misere_atout',
      name: 'Misère d\'atout',
      description:
          'Annonce d\'une misère d\'atout.',
      defaultValue: 10,
    ),
  ];

  //---------------------------------------------------------------------------
  // Recherche
  //---------------------------------------------------------------------------

  static BonusDefinition? byId(
    String id,
  ) {
    for (final bonus in bonuses) {
      if (bonus.id == id) {
        return bonus;
      }
    }

    return null;
  }

  //---------------------------------------------------------------------------
  // Identifiants
  //---------------------------------------------------------------------------

  static List<String> get ids =>
      bonuses
          .map((bonus) => bonus.id)
          .toList(growable: false);
}