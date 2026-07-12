// ***************************************************************************
//
// TarotScore V2
//
// Fichier : contract_catalog.dart
//
// Description : Catalogue des contrats disponibles.
//
// Auteur : David
//
// ***************************************************************************

import '../models/contract_definition.dart';

class ContractCatalog {
  const ContractCatalog._();

  static const contracts = [
    ContractDefinition(
      id: 'contract.petite',
      name: 'Petite',
      description: 'Contrat simple.',
      defaultMultiplier: 1,
    ),

    ContractDefinition(
      id: 'contract.garde',
      name: 'Garde',
      description: 'Contrat Garde.',
      defaultMultiplier: 2,
    ),

    ContractDefinition(
      id: 'contract.garde_sans',
      name: 'Garde sans',
      description: 'Contrat Garde Sans.',
      defaultMultiplier: 4,
    ),

    ContractDefinition(
      id: 'contract.garde_contre',
      name: 'Garde contre',
      description: 'Contrat Garde Contre.',
      defaultMultiplier: 6,
    ),
  ];

  static ContractDefinition? byId(
    String id,
  ) {
    for (final contract in contracts) {
      if (contract.id == id) {
        return contract;
      }
    }

    return null;
  }
}