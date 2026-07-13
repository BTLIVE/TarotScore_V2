// ***************************************************************************
//
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
import 'difference_calculation_mode.dart';
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

  /// Points de base des contrats.
  ///
  /// FFT : 25
  /// Certaines variantes utilisent 20 ou 30.
  final int basePoints;

  /// Mode de calcul de l'écart.
  final DifferenceCalculationMode
      differenceCalculationMode;

  /// Contrats disponibles.
  final List<ContractRule> contracts;

  /// Bonus disponibles.
  final List<BonusRule> bonuses;

  /// Pénalités disponibles.
  final List<PenaltyRule> penalties;

  /// Nombre de points à réaliser selon le nombre de bouts.
  final Map<int, int> targetScores;

  //---------------------------------------------------------------------------
  // Constructeur
  //---------------------------------------------------------------------------

  const RuleProfile({
    required this.uuid,
    required this.name,
    required this.description,
    required this.version,

    this.basePoints = 25,

    this.differenceCalculationMode =
        DifferenceCalculationMode.exact,

    this.contracts = const [],
    this.bonuses = const [],
    this.penalties = const [],
    this.targetScores = const {},
  });

  //---------------------------------------------------------------------------
  // Getters
  //---------------------------------------------------------------------------

  String get displayName => name;

  List<ContractRule> get enabledContracts {
    final list =
        contracts.where((c) => c.enabled).toList();

    list.sort(
      (a, b) => a.order.compareTo(b.order),
    );

    return list;
  }

  List<BonusRule> get enabledBonuses {
    final list =
        bonuses.where((b) => b.enabled).toList();

    list.sort(
      (a, b) => a.order.compareTo(b.order),
    );

    return list;
  }

  List<PenaltyRule> get enabledPenalties {
    final list =
        penalties.where((p) => p.enabled).toList();

    list.sort(
      (a, b) => a.order.compareTo(b.order),
    );

    return list;
  }

  int get contractCount => contracts.length;

  int get enabledContractCount =>
      enabledContracts.length;

  int get bonusCount => bonuses.length;

  int get enabledBonusCount =>
      enabledBonuses.length;

  int get penaltyCount => penalties.length;

  int get enabledPenaltyCount =>
      enabledPenalties.length;

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

  int? targetScore(int oudlers) =>
      targetScores[oudlers];

  //---------------------------------------------------------------------------
  // Mise à jour
  //---------------------------------------------------------------------------

  RuleProfile updateContract(
    ContractRule contract,
  ) =>
      copyWith(
        contracts: contracts
            .map(
              (item) => item.id == contract.id
                  ? contract
                  : item,
            )
            .toList(),
      );

  RuleProfile updateBonus(
    BonusRule bonus,
  ) =>
      copyWith(
        bonuses: bonuses
            .map(
              (item) =>
                  item.id == bonus.id
                      ? bonus
                      : item,
            )
            .toList(),
      );

  RuleProfile updatePenalty(
    PenaltyRule penalty,
  ) =>
      copyWith(
        penalties: penalties
            .map(
              (item) =>
                  item.id == penalty.id
                      ? penalty
                      : item,
            )
            .toList(),
      );

  //---------------------------------------------------------------------------
  // Copy
  //---------------------------------------------------------------------------

  RuleProfile copyWith({
    String? uuid,
    String? name,
    String? description,
    String? version,

    int? basePoints,

    DifferenceCalculationMode?
        differenceCalculationMode,

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

      basePoints:
          basePoints ?? this.basePoints,

      differenceCalculationMode:
          differenceCalculationMode ??
              this.differenceCalculationMode,

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
        'basePoints: $basePoints, '
        'differenceCalculationMode: '
        '$differenceCalculationMode, '
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
            other.basePoints ==
                basePoints &&
            other.differenceCalculationMode ==
                differenceCalculationMode;
  }

  @override
  int get hashCode => Object.hash(
        uuid,
        name,
        description,
        version,
        basePoints,
        differenceCalculationMode,
      );
}