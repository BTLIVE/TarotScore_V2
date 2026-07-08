// ***************************************************************************
//
// TarotScore V2
//
// Fichier : session_player_runtime.dart
//
// Description : Etat courant d'un joueur pendant une session.
//
// Auteur : David
//
// ***************************************************************************

import '../../players/models/player.dart';

import 'player_participation.dart';

class SessionPlayerRuntime {
  //---------------------------------------------------------------------------
  // Identification
  //---------------------------------------------------------------------------

  /// Position permanente dans la session.
  final int position;

  /// Joueur.
  final Player player;

  //---------------------------------------------------------------------------
  // Participation
  //---------------------------------------------------------------------------

  final PlayerParticipation participation;

  //---------------------------------------------------------------------------
  // Scores
  //---------------------------------------------------------------------------

  final int score;

  final int blueTokens;

  //---------------------------------------------------------------------------
  // Constructeur
  //---------------------------------------------------------------------------

  const SessionPlayerRuntime({
    required this.position,
    required this.player,
    required this.participation,
    this.score = 0,
    this.blueTokens = 0,
  });

  //---------------------------------------------------------------------------
  // Getters
  //---------------------------------------------------------------------------

  bool get isPlaying =>
      participation ==
      PlayerParticipation.playing;

  bool get isWaiting =>
      participation ==
      PlayerParticipation.waiting;

  //---------------------------------------------------------------------------
  // Copy
  //---------------------------------------------------------------------------

  SessionPlayerRuntime copyWith({
    PlayerParticipation? participation,
    int? score,
    int? blueTokens,
  }) {
    return SessionPlayerRuntime(
      position: position,
      player: player,
      participation:
          participation ??
          this.participation,
      score: score ?? this.score,
      blueTokens:
          blueTokens ??
          this.blueTokens,
    );
  }

  //---------------------------------------------------------------------------
  // Divers
  //---------------------------------------------------------------------------

  @override
  String toString() {
    return 'SessionPlayerRuntime('
        'position: $position, '
        'participation: $participation, '
        'score: $score, '
        'blueTokens: $blueTokens'
        ')';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is SessionPlayerRuntime &&
            other.position == position &&
            other.player == player &&
            other.participation ==
                participation &&
            other.score == score &&
            other.blueTokens ==
                blueTokens;
  }

  @override
  int get hashCode {
    return Object.hash(
      position,
      player,
      participation,
      score,
      blueTokens,
    );
  }
}