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

  /// Ecart entre les points réalisés et l'objectif.
  ///
  /// Positif si le contrat est réussi.
  final double? difference;

  /// Score de base (25 + écart).
  final int? baseScore;

  /// Multiplicateur du contrat.
  final int? contractMultiplier;

  /// Score après application du multiplicateur.
  final int? contractScore;

  /// Bonus effectivement appliqués.
  final List<AppliedBonus> appliedBonuses;

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
    this.difference,
    this.baseScore,
    this.contractMultiplier,
    this.contractScore,
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
    double? difference,
    int? baseScore,
    int? contractMultiplier,
    int? contractScore,
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
      difference:
          difference ?? this.difference,
      baseScore: baseScore ?? this.baseScore,
      contractMultiplier:
          contractMultiplier ??
              this.contractMultiplier,
      contractScore:
          contractScore ??
              this.contractScore,
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
      difference != null &&
      baseScore != null &&
      contractMultiplier != null &&
      contractScore != null &&
      finalScore != null &&
      playerScores != null;
}