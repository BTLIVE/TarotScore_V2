// ***************************************************************************
// TarotScore V2
//
// Fichier : rule_profile.dart
//
// Description : Profil complet de règles d'une variante de Tarot.
//
// Auteur : David
// ***************************************************************************

import 'bonus_rule.dart';
import 'contract_rule.dart';

class RuleProfile {
  //---------------------------------------------------------------------------
  // Identification
  //---------------------------------------------------------------------------

  /// Identifiant unique permanent.
  final String uuid;

  /// Nom du profil.
  final String name;

  /// Description.
  final String description;

  /// Version du profil.
  final String version;

  //---------------------------------------------------------------------------
  // Configuration
  //---------------------------------------------------------------------------

  /// Profil officiel fourni par TarotScore.
  final bool official;

  /// Profil actif.
  final bool active;

  //---------------------------------------------------------------------------
  // Règles
  //---------------------------------------------------------------------------

  /// Contrats disponibles.
  final List<ContractRule> contracts;

  /// Bonus disponibles.
  final List<BonusRule> bonuses;

  /// Nombre de points à réaliser selon le nombre de bouts.
  ///
  /// Clé :
  ///   0, 1, 2 ou 3 bouts.
  ///
  /// Valeur :
  ///   Score minimum à atteindre.
  final Map<int, int> targetScores;

  //---------------------------------------------------------------------------
  // Constructeur
  //---------------------------------------------------------------------------

  const RuleProfile({
    required this.uuid,
    required this.name,
    required this.description,
    required this.version,
    this.official = false,
    this.active = true,
    this.contracts = const [],
    this.bonuses = const [],
    this.targetScores = const {},
  });

  //---------------------------------------------------------------------------
  // Getters
  //---------------------------------------------------------------------------

  /// Contrats actifs triés par ordre.
  List<ContractRule> get enabledContracts {
    final list = contracts.where((c) => c.enabled).toList();

    list.sort(
      (a, b) => a.order.compareTo(b.order),
    );

    return list;
  }

  /// Bonus actifs triés par ordre.
  List<BonusRule> get enabledBonuses {
    final list = bonuses.where((b) => b.enabled).toList();

    list.sort(
      (a, b) => a.order.compareTo(b.order),
    );

    return list;
  }

  //---------------------------------------------------------------------------
  // Recherche
  //---------------------------------------------------------------------------

  /// Retourne un contrat à partir de son identifiant.
  ///
  /// Renvoie null si le contrat n'existe pas.
  ContractRule? contract(String id) {
    for (final contract in contracts) {
      if (contract.id == id) {
        return contract;
      }
    }

    return null;
  }

  /// Retourne un bonus à partir de son identifiant.
  ///
  /// Renvoie null si le bonus n'existe pas.
  BonusRule? bonus(String id) {
    for (final bonus in bonuses) {
      if (bonus.id == id) {
        return bonus;
      }
    }

    return null;
  }

  /// Retourne le score minimum à atteindre
  /// selon le nombre de bouts.
  ///
  /// Renvoie null si le nombre de bouts est invalide.
  int? targetScore(int bouts) {
    return targetScores[bouts];
  }

  //---------------------------------------------------------------------------
  // Copy
  //---------------------------------------------------------------------------

  RuleProfile copyWith({
    String? uuid,
    String? name,
    String? description,
    String? version,
    bool? official,
    bool? active,
    List<ContractRule>? contracts,
    List<BonusRule>? bonuses,
    Map<int, int>? targetScores,
  }) {
    return RuleProfile(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      description: description ?? this.description,
      version: version ?? this.version,
      official: official ?? this.official,
      active: active ?? this.active,
      contracts: contracts ?? this.contracts,
      bonuses: bonuses ?? this.bonuses,
      targetScores: targetScores ?? this.targetScores,
    );
  }

  //---------------------------------------------------------------------------
  // Divers
  //---------------------------------------------------------------------------

  @override
  String toString() {
    return 'RuleProfile('
        'name: $name, '
        'version: $version, '
        'contracts: ${contracts.length}, '
        'bonuses: ${bonuses.length}'
        ')';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is RuleProfile &&
            other.uuid == uuid &&
            other.name == name &&
            other.description == description &&
            other.version == version &&
            other.official == official &&
            other.active == active;
  }

  @override
  int get hashCode {
    return Object.hash(
      uuid,
      name,
      description,
      version,
      official,
      active,
    );
  }
}