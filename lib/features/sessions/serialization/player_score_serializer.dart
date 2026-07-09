// ***************************************************************************
//
// TarotScore V2
//
// Fichier : player_score_serializer.dart
//
// Description : Sérialisation JSON des PlayerScore.
//
// Auteur : David
//
// ***************************************************************************

import '../models/player_score.dart';

class PlayerScoreSerializer {
  PlayerScoreSerializer._();

  //--------------------------------------------------------------------------
  // Vers JSON
  //--------------------------------------------------------------------------

  static Map<String, dynamic> toJson(
    PlayerScore score,
  ) {
    return {
      'player_position':
          score.playerPosition,

      'total_score':
          score.totalScore,

      'blue_tokens':
          score.blueTokens,
    };
  }

  //--------------------------------------------------------------------------
  // Depuis JSON
  //--------------------------------------------------------------------------

  static PlayerScore fromJson(
    Map<String, dynamic> json,
  ) {
    return PlayerScore(
      playerPosition:
          json['player_position'] as int,

      totalScore:
          json['total_score'] as int,

      blueTokens:
          json['blue_tokens'] as int,
    );
  }

  //--------------------------------------------------------------------------
  // Liste vers JSON
  //--------------------------------------------------------------------------

  static List<Map<String, dynamic>>
      toJsonList(
    List<PlayerScore> scores,
  ) {
    return scores
        .map(toJson)
        .toList(
          growable: false,
        );
  }

  //--------------------------------------------------------------------------
  // Liste depuis JSON
  //--------------------------------------------------------------------------

  static List<PlayerScore>
      fromJsonList(
    List<dynamic> json,
  ) {
    return json
        .map(
          (item) => fromJson(
            item
                as Map<String, dynamic>,
          ),
        )
        .toList(
          growable: false,
        );
  }
}