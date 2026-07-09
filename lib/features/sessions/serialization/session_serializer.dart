// ***************************************************************************
//
// TarotScore V2
//
// Fichier : session_serializer.dart
//
// Description : Sérialisation JSON des sessions.
//
// Auteur : David
//
// ***************************************************************************

import '../../players/serialization/player_serializer.dart';

import '../../rules/services/rule_profile_service.dart';

import '../models/session.dart';

import 'deal_serializer.dart';

class SessionSerializer {
  SessionSerializer._();

  //--------------------------------------------------------------------------
  // Vers JSON
  //--------------------------------------------------------------------------

  static Map<String, dynamic> toJson(
    Session session,
  ) {
    return {
      'uuid': session.uuid,

      'started_at':
          session.startedAt
              .toIso8601String(),

      'finished_at':
          session.finishedAt
              ?.toIso8601String(),

      'rule_profile_uuid':
          session.ruleProfile.uuid,

      'first_dealer_position':
          session.firstDealerPosition,

      'players':
          PlayerSerializer.toJsonList(
        session.players,
      ),

      'deals':
          DealSerializer.toJsonList(
        session.deals,
      ),
    };
  }

  //--------------------------------------------------------------------------
  // Depuis JSON
  //--------------------------------------------------------------------------

  static Session fromJson(
    Map<String, dynamic> json,
  ) {
    final ruleProfile =
        RuleProfileService.instance.getByUuid(
      json['rule_profile_uuid']
          as String,
    );

    if (ruleProfile == null) {
      throw StateError(
        'Profil de règles introuvable : '
        '${json['rule_profile_uuid']}',
      );
    }

    return Session(
      uuid:
          json['uuid'] as String,

      startedAt:
          DateTime.parse(
        json['started_at'] as String,
      ),

      finishedAt:
          json['finished_at'] == null
              ? null
              : DateTime.parse(
                  json['finished_at']
                      as String,
                ),

      ruleProfile: ruleProfile,

      players:
          PlayerSerializer.fromJsonList(
        json['players']
            as List<dynamic>,
      ),

      firstDealerPosition:
          json['first_dealer_position']
              as int,

      deals:
          DealSerializer.fromJsonList(
        json['deals']
            as List<dynamic>,
      ),
    );
  }
}