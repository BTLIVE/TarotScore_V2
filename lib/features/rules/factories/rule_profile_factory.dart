// ***************************************************************************
//
// TarotScore V2
//
// Fichier : rule_profile_factory.dart
//
// Description : Fabrique de profils de règles.
//
// Auteur : David
//
// ***************************************************************************

import 'package:uuid/uuid.dart';

import '../catalog/default_rule_catalog.dart';
import '../models/rule_profile.dart';

class RuleProfileFactory {
  RuleProfileFactory._();

  //---------------------------------------------------------------------------
  // Création
  //---------------------------------------------------------------------------

  static RuleProfile create({
    required String name,
    String description = '',
    String version = '1.0',
  }) {
    final catalog =
        DefaultRuleCatalog.catalog;

    return RuleProfile(
      uuid: const Uuid().v4(),

      name: name,

      description: description,

      version: version,

      basePoints: 25,

      contracts:
          catalog.contracts
              .map(
                (contract) =>
                    contract.copyWith(),
              )
              .toList(),

      bonuses:
          catalog.bonuses
              .map(
                (bonus) =>
                    bonus.copyWith(),
              )
              .toList(),

      penalties:
          catalog.penalties
              .map(
                (penalty) =>
                    penalty.copyWith(),
              )
              .toList(),

      targetScores:
          Map<int, int>.from(
        catalog.targetScores,
      ),
    );
  }
}
