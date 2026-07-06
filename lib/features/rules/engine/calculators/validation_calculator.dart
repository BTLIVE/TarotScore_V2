// ***************************************************************************
// TarotScore V2
//
// Fichier : validation_calculator.dart
//
// Description : Validation des données d'une manche avant calcul.
//
// Auteur : David
// ***************************************************************************

import '../../../sessions/models/deal.dart';
import '../../models/rule_profile.dart';
import '../exceptions/invalid_deal_exception.dart';
import '../pipeline/deal_calculation.dart';
import 'calculator.dart';

class ValidationCalculator implements Calculator {
  const ValidationCalculator();

  //--------------------------------------------------------------------------
  // Calcul
  //--------------------------------------------------------------------------

  @override
  DealCalculation calculate(
    DealCalculation calculation,
  ) {
    final profile = calculation.session.ruleProfile;
    final deal = calculation.deal;

    _validateContract(
      profile,
      deal,
    );

    _validateOudlers(
      deal,
    );

    _validatePoints(
      deal,
    );

    return calculation;
  }

  //--------------------------------------------------------------------------
  // Contrat
  //--------------------------------------------------------------------------

  void _validateContract(
    RuleProfile profile,
    Deal deal,
  ) {
    final contract = profile.contract(
      deal.contractId,
    );

    if (contract == null) {
      throw InvalidDealException(
        'Contrat inconnu : ${deal.contractId}',
      );
    }

    if (!contract.enabled) {
      throw InvalidDealException(
        'Contrat désactivé : ${deal.contractId}',
      );
    }
  }

  //--------------------------------------------------------------------------
  // Bouts
  //--------------------------------------------------------------------------

  void _validateOudlers(
    Deal deal,
  ) {
    if (deal.oudlers < 0 || deal.oudlers > 3) {
      throw InvalidDealException(
        'Le nombre de bouts doit être compris entre 0 et 3.',
      );
    }
  }

  //--------------------------------------------------------------------------
  // Points
  //--------------------------------------------------------------------------

  void _validatePoints(
    Deal deal,
  ) {
    if (deal.points < 0 || deal.points > 91) {
      throw InvalidDealException(
        'Le nombre de points doit être compris entre 0 et 91.',
      );
    }
  }
}