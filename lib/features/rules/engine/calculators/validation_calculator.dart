// ***************************************************************************
//
// TarotScore V2
//
// Fichier : validation_calculator.dart
//
// Description : Validation des données d'une manche avant calcul.
//
// Auteur : David
//
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
    final profile = calculation.profile;
    final deal = calculation.deal;

    _validateContract(
      profile,
      deal,
    );

    _validatePlayers(
      calculation.playerCount,
      deal,
    );

    _validateOudlers(
      deal,
    );

    _validatePoints(
      deal,
    );

    _validateBonuses(
      profile,
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
  // Joueurs
  //--------------------------------------------------------------------------

  void _validatePlayers(
    int playerCount,
    Deal deal,
  ) {
    switch (playerCount) {
      case 4:
        if (deal.hasCalledPartner) {
          throw InvalidDealException(
            'À 4 joueurs, il ne peut pas y avoir d\'appelé.',
          );
        }

        if (deal.partnerPosition != null) {
          throw InvalidDealException(
            'À 4 joueurs, partnerPosition doit être null.',
          );
        }
        break;

      case 5:
        if (deal.hasCalledPartner) {
          if (deal.partnerPosition == null) {
            throw InvalidDealException(
              'Le partenaire est obligatoire.',
            );
          }

          if (deal.partnerPosition ==
              deal.attackerPosition) {
            throw InvalidDealException(
              'Le partenaire ne peut pas être le preneur.',
            );
          }
        } else {
          if (deal.partnerPosition != null) {
            throw InvalidDealException(
              'partnerPosition doit être null lorsque le preneur joue seul.',
            );
          }
        }
        break;

      default:
        throw InvalidDealException(
          'Seules les parties à 4 et 5 joueurs sont supportées.',
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

  //--------------------------------------------------------------------------
  // Bonus
  //--------------------------------------------------------------------------

  void _validateBonuses(
    RuleProfile profile,
    Deal deal,
  ) {
    _validateSingleBonusType(
      profile: profile,
      deal: deal,
      typeId: 'poignee',
      message:
          'Une seule poignée peut être déclarée.',
    );
  }

  //--------------------------------------------------------------------------

  void _validateSingleBonusType({
    required RuleProfile profile,
    required Deal deal,
    required String typeId,
    required String message,
  }) {
    final count = deal.events.where((event) {
      final rule = profile.bonus(
        event.id,
      );

      return rule?.typeId == typeId;
    }).length;

    if (count > 1) {
      throw InvalidDealException(
        message,
      );
    }
  }
}