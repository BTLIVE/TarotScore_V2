// ***************************************************************************
//
// TarotScore V2
//
// Fichier : deal_context.dart
//
// Description : Contexte d'une donne utilisé par le moteur de calcul.
//
// Ce modèle regroupe les informations de contexte nécessaires aux
// calculateurs sans dépendre de SessionState.
//
// Auteur : David
//
// ***************************************************************************

class DealContext {
  //--------------------------------------------------------------------------
  // Joueurs
  //--------------------------------------------------------------------------

  /// Positions des joueurs participant à la donne.
  ///
  /// Ces positions correspondent aux positions dans la session.
  final List<int> activePlayerPositions;

  /// Positions des joueurs morts.
  ///
  /// Liste vide à 4 et 5 joueurs.
  final List<int> deadPlayerPositions;

  /// Position du donneur dans la session.
  final int dealerPosition;

  //--------------------------------------------------------------------------
  // Constructeur
  //--------------------------------------------------------------------------

  const DealContext({
    required this.activePlayerPositions,
    required this.deadPlayerPositions,
    required this.dealerPosition,
  });

  //--------------------------------------------------------------------------
  // Getters
  //--------------------------------------------------------------------------

  /// Nombre de joueurs participant à la donne.
  int get playerCount =>
      activePlayerPositions.length;

  /// Aucun joueur mort.
  bool get hasDeadPlayers =>
      deadPlayerPositions.isNotEmpty;
}