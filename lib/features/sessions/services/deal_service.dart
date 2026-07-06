// ***************************************************************************
// TarotScore V2
//
// Fichier : deal_service.dart
//
// Description : Gestion des donnes d'une session.
//
// Ce service ne réalise aucun calcul de score.
// Il se contente de modifier la liste des donnes.
//
// Auteur : David
// ***************************************************************************

import '../models/deal.dart';
import '../models/session.dart';

class DealService {
  const DealService();

  //--------------------------------------------------------------------------
  // Ajout d'une donne
  //--------------------------------------------------------------------------

  Session applyDeal({
    required Session session,
    required Deal deal,
  }) {
    return session.copyWith(
      deals: [
        ...session.deals,
        deal,
      ],
    );
  }

  //--------------------------------------------------------------------------
  // Suppression de la dernière donne
  //--------------------------------------------------------------------------

  Session removeLastDeal({
    required Session session,
  }) {
    if (!session.hasDeals) {
      return session;
    }

    final deals = List<Deal>.from(
      session.deals,
    )..removeLast();

    return session.copyWith(
      deals: deals,
    );
  }
}