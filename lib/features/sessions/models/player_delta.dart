// ***************************************************************************
//
// TarotScore V2
//
// Fichier : player_delta.dart
//
// Description : Variation de score d'un joueur pour une donne.
//
// Auteur : David
//
// ***************************************************************************

class PlayerDelta {
  //---------------------------------------------------------------------------
  // Joueur
  //---------------------------------------------------------------------------

  /// Position du joueur dans la session.
  final int playerPosition;

  //---------------------------------------------------------------------------
  // Score
  //---------------------------------------------------------------------------

  /// Variation du score.
  ///
  /// Positive ou négative.
  final int delta;

  //---------------------------------------------------------------------------
  // Constructeur
  //---------------------------------------------------------------------------

  const PlayerDelta({
    required this.playerPosition,
    required this.delta,
  });

  //---------------------------------------------------------------------------
  // Getters
  //---------------------------------------------------------------------------

  bool get isPositive => delta > 0;

  bool get isNegative => delta < 0;

  //---------------------------------------------------------------------------
  // Divers
  //---------------------------------------------------------------------------

  @override
  String toString() {
    return 'PlayerDelta('
        'player: $playerPosition, '
        'delta: $delta'
        ')';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is PlayerDelta &&
            other.playerPosition ==
                playerPosition &&
            other.delta == delta;
  }

  @override
  int get hashCode =>
      Object.hash(
        playerPosition,
        delta,
      );
}