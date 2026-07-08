// ***************************************************************************
//
// TarotScore V2
//
// Fichier : session_play_service.dart
//
// Description : Déroulement d'une partie.
//
// Auteur : David
//
// ***************************************************************************

import '../../rules/factories/rule_engine_factory.dart';

import '../models/deal.dart';
import '../models/session_state.dart';

import 'deal_service.dart';
import 'dealer_service.dart';
import 'session_service.dart';
import 'session_state_service.dart';

class SessionPlayService {
  SessionPlayService._();

  static final SessionPlayService instance =
      SessionPlayService._();

  //--------------------------------------------------------------------------
  // Dépendances
  //--------------------------------------------------------------------------

  final DealService _dealService =
      const DealService();

  late final SessionStateService
      _stateService =
          SessionStateService(
    ruleEngine:
        RuleEngineFactory.create(),
    dealerService:
        const DealerService(),
  );

  //--------------------------------------------------------------------------
  // Joue une donne
  //--------------------------------------------------------------------------

  SessionState playDeal({
    required Deal deal,
  }) {
    final current =
        SessionService.instance
            .requireCurrentSession();

    final updatedSession =
        _dealService.applyDeal(
      session: current.session,
      deal: deal,
    );

    final updatedState =
        _stateService.createState(
      session: updatedSession,
    );

    SessionService.instance
        .updateCurrentSession(
      updatedState,
    );

    return updatedState;
  }

  //--------------------------------------------------------------------------
  // Annule la dernière donne
  //--------------------------------------------------------------------------

  SessionState undoLastDeal() {
    final current =
        SessionService.instance
            .requireCurrentSession();

    final updatedSession =
        _dealService.removeLastDeal(
      session: current.session,
    );

    final updatedState =
        _stateService.createState(
      session: updatedSession,
    );

    SessionService.instance
        .updateCurrentSession(
      updatedState,
    );

    return updatedState;
  }
}