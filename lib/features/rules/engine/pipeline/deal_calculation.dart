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
import '../../../sessions/models/session.dart';

class DealCalculation {
  /// Session en cours.
  final Session session;

  /// Manche à calculer.
  final Deal deal;

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

  const DealCalculation({
    required this.session,
    required this.deal,
    this.success,
    this.baseScore,
    this.contractScore,
    this.playerScores,
  });

  DealCalculation copyWith({
    Session? session,
    Deal? deal,
    bool? success,
    int? baseScore,
    int? contractScore,
    Map<int, int>? playerScores,
  }) {
    return DealCalculation(
      session: session ?? this.session,
      deal: deal ?? this.deal,
      success: success ?? this.success,
      baseScore: baseScore ?? this.baseScore,
      contractScore: contractScore ?? this.contractScore,
      playerScores: playerScores ?? this.playerScores,
    );
  }
}