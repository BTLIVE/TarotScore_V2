// ***************************************************************************
//
// TarotScore V2
//
// Fichier : deal_serializer.dart
//
// Description : Sérialisation JSON des donnes.
//
// Auteur : David
//
// ***************************************************************************

import '../../rules/engine/models/deal_event.dart';

import '../models/deal.dart';

class DealSerializer {
  DealSerializer._();

  //--------------------------------------------------------------------------
  // Vers JSON
  //--------------------------------------------------------------------------

  static Map<String, dynamic> toJson(
    Deal deal,
  ) {
    return {
      'uuid': deal.uuid,

      'number': deal.number,

      'attacker_position':
          deal.attackerPosition,

      'partner_position':
          deal.partnerPosition,

      'contract_id':
          deal.contractId,

      'oudlers':
          deal.oudlers,

      'points':
          deal.points,

      'events': deal.events
          .map(_eventToJson)
          .toList(
            growable: false,
          ),
    };
  }

  //--------------------------------------------------------------------------
  // Depuis JSON
  //--------------------------------------------------------------------------

  static Deal fromJson(
    Map<String, dynamic> json,
  ) {
    final partnerPosition =
        json['partner_position'] as int?;

    return Deal(
      uuid:
          json['uuid'] as String,

      number:
          json['number'] as int,

      attackerPosition:
          json['attacker_position']
              as int,

      hasCalledPartner:
          partnerPosition != null,

      partnerPosition:
          partnerPosition,

      contractId:
          json['contract_id']
              as String,

      oudlers:
          json['oudlers'] as int,

      points:
          (json['points'] as num)
              .toDouble(),

      events:
          (json['events']
                      as List<dynamic>? ??
                  const [])
              .map(
                (event) =>
                    _eventFromJson(
                  event
                      as Map<String, dynamic>,
                ),
              )
              .toList(
                growable: false,
              ),
    );
  }

  //--------------------------------------------------------------------------
  // Liste vers JSON
  //--------------------------------------------------------------------------

  static List<Map<String, dynamic>>
      toJsonList(
    List<Deal> deals,
  ) {
    return deals
        .map(toJson)
        .toList(
          growable: false,
        );
  }

  //--------------------------------------------------------------------------
  // Liste depuis JSON
  //--------------------------------------------------------------------------

  static List<Deal>
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

  //--------------------------------------------------------------------------
  // DealEvent
  //--------------------------------------------------------------------------

  static Map<String, dynamic>
      _eventToJson(
    DealEvent event,
  ) {
    return {
      'id': event.id,
      'value': event.value,
    };
  }

  static DealEvent
      _eventFromJson(
    Map<String, dynamic> json,
  ) {
    return DealEvent(
      id: json['id'] as String,
      value: json['value'],
    );
  }
}