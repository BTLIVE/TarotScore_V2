// ***************************************************************************
//
// TarotScore V2
//
// Fichier : dealer_service.dart
//
// Description : Gestion de la rotation des joueurs.
//
// Auteur : David
//
// ***************************************************************************

import '../models/session.dart';

class DealerService {
  const DealerService();

  //--------------------------------------------------------------------------
  // Donneur courant
  //--------------------------------------------------------------------------

  int currentDealer(
    Session session,
  ) {
    return (session.firstDealerPosition +
            session.deals.length) %
        session.playerCount;
  }

  //--------------------------------------------------------------------------
  // Joueur suivant
  //--------------------------------------------------------------------------

  int nextPlayer({
    required Session session,
    required int playerPosition,
  }) {
    return (playerPosition + 1) %
        session.playerCount;
  }

  //--------------------------------------------------------------------------
  // Joueur précédent
  //--------------------------------------------------------------------------

  int previousPlayer({
    required Session session,
    required int playerPosition,
  }) {
    return (playerPosition - 1 +
            session.playerCount) %
        session.playerCount;
  }

  //--------------------------------------------------------------------------
  // Position à gauche
  //--------------------------------------------------------------------------

  int leftPlayer(
    Session session,
    int playerPosition,
  ) {
    return nextPlayer(
      session: session,
      playerPosition: playerPosition,
    );
  }

  //--------------------------------------------------------------------------
  // Position à droite
  //--------------------------------------------------------------------------

  int rightPlayer(
    Session session,
    int playerPosition,
  ) {
    return previousPlayer(
      session: session,
      playerPosition: playerPosition,
    );
  }
}