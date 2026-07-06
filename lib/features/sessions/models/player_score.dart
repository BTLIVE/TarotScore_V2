// ***************************************************************************
// TarotScore V2
//
// Fichier : player_score.dart
//
// Description : Etat d'un joueur pendant une session.
//
// Cette classe n'est jamais enregistrée en base.
// Elle est reconstruite à partir des donnes.
//
// Auteur : David
// ***************************************************************************

class PlayerScore {
  //--------------------------------------------------------------------------
  // Identification
  //--------------------------------------------------------------------------

  /// Position du joueur dans la session.
  final int playerPosition;

  //--------------------------------------------------------------------------
  // Score
  //--------------------------------------------------------------------------

  /// Score cumulé.
  final int totalScore;

  /// Nombre de jetons bleus.
  final int blueTokens;

  //--------------------------------------------------------------------------
  // Constructeur
  //--------------------------------------------------------------------------

  const PlayerScore({
    required this.playerPosition,
    this.totalScore = 0,
    this.blueTokens = 0,
  });

  //--------------------------------------------------------------------------
  // Copy
  //--------------------------------------------------------------------------

  PlayerScore copyWith({
    int? playerPosition,
    int? totalScore,
    int? blueTokens,
  }) {
    return PlayerScore(
      playerPosition: playerPosition ?? this.playerPosition,
      totalScore: totalScore ?? this.totalScore,
      blueTokens: blueTokens ?? this.blueTokens,
    );
  }

  //--------------------------------------------------------------------------
  // Divers
  //--------------------------------------------------------------------------

  @override
  String toString() {
    return 'PlayerScore('
        'position: $playerPosition, '
        'score: $totalScore, '
        'blueTokens: $blueTokens'
        ')';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is PlayerScore &&
            other.playerPosition == playerPosition &&
            other.totalScore == totalScore &&
            other.blueTokens == blueTokens;
  }

  @override
  int get hashCode => Object.hash(
        playerPosition,
        totalScore,
        blueTokens,
      );
}