// ***************************************************************************
// TarotScore V2
//
// Fichier : deal_calculation.dart
//
// Description : Etat du calcul d'une manche.
//
// Auteur : David
// ***************************************************************************

import '../../../sessions/models/deal.dart';
import '../../models/rule_profile.dart';

class DealCalculation {
  //--------------------------------------------------------------------------
  // Contexte
  //--------------------------------------------------------------------------

  /// Profil de règles utilisé.
  final RuleProfile profile;

  /// Nombre de joueurs de la partie.
  final int playerCount;

  /// Manche à calculer.
  final Deal deal;

  //--------------------------------------------------------------------------
  // Résultats intermédiaires
  //--------------------------------------------------------------------------

  /// Contrat réussi.
  final bool? success;

  /// Score de base (25 + écart).
  final int? baseScore;

  /// Score après application du multiplicateur de contrat.
  final int? contractScore;

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
    required this.playerCount,
    required this.deal,
    this.success,
    this.baseScore,
    this.contractScore,
    this.playerScores,
  });

  //--------------------------------------------------------------------------
  // Copy
  //--------------------------------------------------------------------------

  DealCalculation copyWith({
    RuleProfile? profile,
    int? playerCount,
    Deal? deal,
    bool? success,
    int? baseScore,
    int? contractScore,
    Map<int, int>? playerScores,
  }) {
    return DealCalculation(
      profile: profile ?? this.profile,
      playerCount: playerCount ?? this.playerCount,
      deal: deal ?? this.deal,
      success: success ?? this.success,
      baseScore: baseScore ?? this.baseScore,
      contractScore: contractScore ?? this.contractScore,
      playerScores: playerScores ?? this.playerScores,
    );
  }
}