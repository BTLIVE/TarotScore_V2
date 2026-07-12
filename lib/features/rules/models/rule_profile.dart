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
import 'penalty_rule.dart';

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

  /// Pénalités disponibles.
  final List<PenaltyRule> penalties;

  /// Nombre de points à réaliser selon le nombre de bouts.
  ///
  /// Clé : 0, 1, 2 ou 3 bouts.
  /// Valeur : score minimum à atteindre.
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
    this.penalties = const [],
    this.targetScores = const {},
  });

  //---------------------------------------------------------------------------
  // Getters
  //---------------------------------------------------------------------------

  /// Nom affiché dans l'interface.
  String get displayName => name;

  /// Contrats actifs triés par ordre.
  List<ContractRule> get enabledContracts {
    final list =
        contracts.where((c) => c.enabled).toList();

    list.sort(
      (a, b) => a.order.compareTo(b.order),
    );

    return list;
  }

  /// Bonus actifs triés par ordre.
  List<BonusRule> get enabledBonuses {
    final list =
        bonuses.where((b) => b.enabled).toList();

    list.sort(
      (a, b) => a.order.compareTo(b.order),
    );

    return list;
  }

  /// Pénalités actives triées par ordre.
  List<PenaltyRule> get enabledPenalties {
    final list =
        penalties.where((p) => p.enabled).toList();

    list.sort(
      (a, b) => a.order.compareTo(b.order),
    );

    return list;
  }

  /// Nombre total de contrats.
  int get contractCount => contracts.length;

  /// Nombre de contrats actifs.
  int get enabledContractCount =>
      enabledContracts.length;

  /// Nombre total de bonus.
  int get bonusCount => bonuses.length;

  /// Nombre de bonus actifs.
  int get enabledBonusCount =>
      enabledBonuses.length;

  /// Nombre total de pénalités.
  int get penaltyCount => penalties.length;

  /// Nombre de pénalités actives.
  int get enabledPenaltyCount =>
      enabledPenalties.length;

  /// Résumé du profil.
  String get summary =>
      '$enabledContractCount contrat'
      '${enabledContractCount > 1 ? 's' : ''}'
      ' • '
      '$enabledBonusCount bonus';

  /// Le profil est modifiable.
  bool get isEditable => !official;

  /// Le profil peut être supprimé.
  bool get isDeletable => !official;

  //---------------------------------------------------------------------------
  // Recherche
  //---------------------------------------------------------------------------

  /// Retourne un contrat à partir de son identifiant.
  ContractRule? contract(String id) {
    for (final contract in contracts) {
      if (contract.id == id) {
        return contract;
      }
    }

    return null;
  }

  /// Retourne un bonus à partir de son identifiant.
  BonusRule? bonus(String id) {
    for (final bonus in bonuses) {
      if (bonus.id == id) {
        return bonus;
      }
    }

    return null;
  }

  /// Retourne une pénalité à partir de son identifiant.
  PenaltyRule? penalty(String id) {
    for (final penalty in penalties) {
      if (penalty.id == id) {
        return penalty;
      }
    }

    return null;
  }

  /// Retourne le score minimum à atteindre selon le nombre de bouts.
  int? targetScore(int oudlers) {
    return targetScores[oudlers];
  }

  //---------------------------------------------------------------------------
  // Mise à jour
  //---------------------------------------------------------------------------

  /// Met à jour un contrat du profil.
  RuleProfile updateContract(
    ContractRule contract,
  ) {
    final updatedContracts =
        contracts
            .map(
              (item) => item.id == contract.id
                  ? contract
                  : item,
            )
            .toList();

    return copyWith(
      contracts: updatedContracts,
    );
  }

  /// Met à jour un bonus du profil.
  RuleProfile updateBonus(
    BonusRule bonus,
  ) {
    final updatedBonuses =
        bonuses
            .map(
              (item) =>
                  item.id == bonus.id
                      ? bonus
                      : item,
            )
            .toList();

    return copyWith(
      bonuses: updatedBonuses,
    );
  }

  /// Met à jour une pénalité du profil.
  RuleProfile updatePenalty(
    PenaltyRule penalty,
  ) {
    final updatedPenalties =
        penalties
            .map(
              (item) =>
                  item.id == penalty.id
                      ? penalty
                      : item,
            )
            .toList();

    return copyWith(
      penalties: updatedPenalties,
    );
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
    List<PenaltyRule>? penalties,
    Map<int, int>? targetScores,
  }) {
    return RuleProfile(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      description:
          description ?? this.description,
      version: version ?? this.version,
      official: official ?? this.official,
      active: active ?? this.active,
      contracts: contracts ?? this.contracts,
      bonuses: bonuses ?? this.bonuses,
      penalties: penalties ?? this.penalties,
      targetScores:
          targetScores ?? this.targetScores,
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
        'bonuses: ${bonuses.length}, '
        'penalties: ${penalties.length}'
        ')';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is RuleProfile &&
            other.uuid == uuid &&
            other.name == name &&
            other.description ==
                description &&
            other.version == version &&
            other.official ==
                official &&
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