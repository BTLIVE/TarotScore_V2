// ***************************************************************************
//
// TarotScore V2
//
// Fichier : deal_factory.dart
//
// Description : Construction d'une donne.
//
// Auteur : David
//
// ***************************************************************************

import 'package:uuid/uuid.dart';

import '../../rules/engine/models/deal_event.dart';
import '../models/deal.dart';
import '../models/session_state.dart';

class DealFactory {
  DealFactory._();

  static final DealFactory instance =
      DealFactory._();

  static const Uuid _uuid = Uuid();

  //--------------------------------------------------------------------------
  // Création
  //--------------------------------------------------------------------------

  Deal create({
    required SessionState state,
    required int attackerPosition,
    required int? partnerPosition,
    required String contractId,
    required int oudlers,
    required double points,
    List<DealEvent> events = const [],
  }) {
    return Deal(
      uuid: _uuid.v4(),

      number: state.nextDealNumber,

      attackerPosition: attackerPosition,

      hasCalledPartner:
          partnerPosition != null,

      partnerPosition: partnerPosition,

      contractId: contractId,

      oudlers: oudlers,

      points: points,

      events: List.unmodifiable(events),
    );
  }
}