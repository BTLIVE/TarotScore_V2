// ***************************************************************************
//
// TarotScore V2
//
// Fichier : deal_result.dart
//
// Description : Résultat complet du calcul d'une donne.
//
// Auteur : David
//
// ***************************************************************************

import 'applied_bonus.dart';
import 'player_delta.dart';

class DealResult {
  //---------------------------------------------------------------------------
  // Calcul
  //---------------------------------------------------------------------------

  /// Objectif à atteindre.
  final int target;

  /// Points réalisés.
  final int points;

  /// Écart avec l'objectif.
  final int difference;

  /// Score de base (25 + écart).
  final int baseScore;

  /// Multiplicateur du contrat.
  final int contractMultiplier;

  /// Score après application du contrat.
  final int contractScore;

  //---------------------------------------------------------------------------
  // Bonus
  //---------------------------------------------------------------------------

  /// Bonus effectivement appliqués.
  final List<AppliedBonus> bonuses;

  //---------------------------------------------------------------------------
  // Résultat final
  //---------------------------------------------------------------------------

  /// Valeur finale de la donne.
  final int finalScore;

  /// Variation des scores de chaque joueur.
  final List<PlayerDelta> playerDeltas;

  //---------------------------------------------------------------------------
  // Constructeur
  //---------------------------------------------------------------------------

  const DealResult({
    required this.target,
    required this.points,
    required this.difference,
    required this.baseScore,
    required this.contractMultiplier,
    required this.contractScore,
    this.bonuses = const [],
    required this.finalScore,
    this.playerDeltas = const [],
  });

  //---------------------------------------------------------------------------
  // Getters
  //---------------------------------------------------------------------------

  bool get hasBonuses =>
      bonuses.isNotEmpty;
}