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

  //---------------------------------------------------------------------------
  // Recherche
  //---------------------------------------------------------------------------

  ContractRule? contract(String id) {
    for (final contract in contracts) {
      if (contract.id == id) {
        return contract;
      }
    }

    return null;
  }

  BonusRule? bonus(String id) {
    for (final bonus in bonuses) {
      if (bonus.id == id) {
        return bonus;
      }
    }

    return null;
  }

  PenaltyRule? penalty(String id) {
    for (final penalty in penalties) {
      if (penalty.id == id) {
        return penalty;
      }
    }

    return null;
  }

  int? targetScore(int oudlers) {
    return targetScores[oudlers];
  }

  //---------------------------------------------------------------------------
  // Mise à jour
  //---------------------------------------------------------------------------

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
            other.description == description &&
            other.version == version;
  }

  @override
  int get hashCode => Object.hash(
        uuid,
        name,
        description,
        version,
      );
}