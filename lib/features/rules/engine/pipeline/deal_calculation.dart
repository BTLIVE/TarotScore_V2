// ***************************************************************************
// TarotScore V2
//
// Fichier : deal_calculation.dart
//
// Description : Etat du calcul d'une manche.
//
// Auteur : David
// ***************************************************************************

import '../../../sessions/models/applied_bonus.dart';
import '../../../sessions/models/deal.dart';
import '../../models/rule_profile.dart';
import 'deal_context.dart';

class DealCalculation {
  //--------------------------------------------------------------------------
  // Contexte
  //--------------------------------------------------------------------------

  /// Profil de règles utilisé.
  final RuleProfile profile;

  /// Contexte de la donne.
  final DealContext context;

  /// Manche à calculer.
  final Deal deal;

  //--------------------------------------------------------------------------
  // Résultats intermédiaires
  //--------------------------------------------------------------------------

  /// Contrat réussi.
  final bool? success;

  /// Nombre de points nécessaires pour réussir.
  final double? target;

  //--------------------------------------------------------------------------
  // Différence
  //--------------------------------------------------------------------------

  /// Ecart brut entre les points réalisés et l'objectif.
  ///
  /// Positif si le contrat est réussi.
  final double? rawDifference;

  /// Ecart retenu après application des règles du profil.
  final double? difference;

  //--------------------------------------------------------------------------
  // Composantes du score
  //--------------------------------------------------------------------------

  /// Points provenant du contrat.
  final int? contractPoints;

  /// Points provenant de l'écart.
  final int? differencePoints;

  /// Total des bonus.
  final int bonusPoints;

  /// Total des pénalités.
  final int penaltyPoints;

  //--------------------------------------------------------------------------
  // Bonus
  //--------------------------------------------------------------------------

  /// Bonus effectivement appliqués.
  final List<AppliedBonus> appliedBonuses;

  //--------------------------------------------------------------------------
  // Résultat
  //--------------------------------------------------------------------------

  /// Score final de la donne.
  final int? finalScore;

  /// Score final de chaque joueur.
  ///
  /// Clé : position du joueur dans la session.
  /// Valeur : score de la manche.
  final Map<int, int>? playerScores;

  //--------------------------------------------------------------------------
  // Constructeur
  //--------------------------------------------------------------------------

  const DealCalculation({
    required this.profile,
    required this.context,
    required this.deal,

    this.success,
    this.target,

    this.rawDifference,
    this.difference,

    this.contractPoints,
    this.differencePoints,

    this.bonusPoints = 0,
    this.penaltyPoints = 0,

    this.appliedBonuses = const [],

    this.finalScore,
    this.playerScores,
  });

  //--------------------------------------------------------------------------
  // Copy
  //--------------------------------------------------------------------------
    DealCalculation copyWith({
    RuleProfile? profile,
    DealContext? context,
    Deal? deal,

    bool? success,
    double? target,

    double? rawDifference,
    double? difference,

    int? contractPoints,
    int? differencePoints,

    int? bonusPoints,
    int? penaltyPoints,

    List<AppliedBonus>? appliedBonuses,

    int? finalScore,
    Map<int, int>? playerScores,
  }) {
    return DealCalculation(
      profile: profile ?? this.profile,
      context: context ?? this.context,
      deal: deal ?? this.deal,

      success: success ?? this.success,
      target: target ?? this.target,

      rawDifference:
          rawDifference ?? this.rawDifference,

      difference:
          difference ?? this.difference,

      contractPoints:
          contractPoints ?? this.contractPoints,

      differencePoints:
          differencePoints ??
              this.differencePoints,

      bonusPoints:
          bonusPoints ?? this.bonusPoints,

      penaltyPoints:
          penaltyPoints ?? this.penaltyPoints,

      appliedBonuses:
          appliedBonuses ??
              this.appliedBonuses,

      finalScore:
          finalScore ?? this.finalScore,

      playerScores:
          playerScores ?? this.playerScores,
    );
  }

  //--------------------------------------------------------------------------
  // Getters
  //--------------------------------------------------------------------------

  /// Nombre de joueurs participant à la donne.
  int get playerCount =>
      context.playerCount;

  /// Des bonus ont été appliqués.
  bool get hasBonuses =>
      appliedBonuses.isNotEmpty;

  /// Les scores joueurs sont disponibles.
  bool get hasPlayerScores =>
      playerScores != null;

  /// Le calcul est terminé.
  bool get isComplete =>
      success != null &&
      target != null &&
      rawDifference != null &&
      difference != null &&
      contractPoints != null &&
      differencePoints != null &&
      finalScore != null &&
      playerScores != null;
}