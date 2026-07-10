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

import '../../rules/engine/pipeline/deal_calculation.dart';
import '../../rules/engine/rule_engine.dart';
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

  /// Moteur de calcul.
  final RuleEngine _ruleEngine =
      RuleEngineFactory.create();

  late final SessionStateService
      _stateService =
          SessionStateService(
    ruleEngine: _ruleEngine,
    dealerService:
        const DealerService(),
  );

  //--------------------------------------------------------------------------
  // Prévisualisation d'une donne
  //--------------------------------------------------------------------------

  DealCalculation previewDeal({
    required Deal deal,
  }) {
    final current =
        SessionService.instance
            .requireCurrentSession();

    return _ruleEngine.calculate(
      profile:
          current.session.ruleProfile,
      playerCount:
          current.activePlayerPositions.length,
      deal: deal,
    );
  }

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