// ***************************************************************************
//
// TarotScore V2
//
// Fichier : session_state_serializer.dart
//
// Description : Sérialisation JSON de l'état d'une session.
//
// Auteur : David
//
// ***************************************************************************

import '../models/session_state.dart';

import 'player_score_serializer.dart';
import 'session_serializer.dart';

class SessionStateSerializer {
  SessionStateSerializer._();

  //--------------------------------------------------------------------------
  // Vers JSON
  //--------------------------------------------------------------------------

  static Map<String, dynamic> toJson(
    SessionState state,
  ) {
    return {
      'session':
          SessionSerializer.toJson(
        state.session,
      ),

      'player_scores':
          PlayerScoreSerializer.toJsonList(
        state.playerScores,
      ),

      'active_player_positions':
          state.activePlayerPositions,

      'dead_player_positions':
          state.deadPlayerPositions,

      'next_deal_number':
          state.nextDealNumber,

      'next_dealer_position':
          state.nextDealerPosition,
    };
  }

  //--------------------------------------------------------------------------
  // Depuis JSON
  //--------------------------------------------------------------------------

  static SessionState fromJson(
    Map<String, dynamic> json,
  ) {
    return SessionState(
      session:
          SessionSerializer.fromJson(
        json['session']
            as Map<String, dynamic>,
      ),

      playerScores:
          PlayerScoreSerializer.fromJsonList(
        json['player_scores']
            as List<dynamic>,
      ),

      activePlayerPositions:
          (json['active_player_positions']
                  as List<dynamic>)
              .cast<int>(),

      deadPlayerPositions:
          (json['dead_player_positions']
                  as List<dynamic>)
              .cast<int>(),

      nextDealNumber:
          json['next_deal_number']
              as int,

      nextDealerPosition:
          json['next_dealer_position']
              as int,
    );
  }
}