// ***************************************************************************
//
// TarotScore V2
//
// Fichier : table_setup_result.dart
//
// Description : Résultat de la configuration de la table.
//
// Auteur : David
//
// ***************************************************************************

import '../../players/models/player.dart';

class TableSetupResult {
  //---------------------------------------------------------------------------
  // Données
  //---------------------------------------------------------------------------

  /// Joueurs dans l'ordre autour de la table.
  final List<Player> players;

  /// Position du premier donneur.
  final int firstDealerPosition;

  //---------------------------------------------------------------------------
  // Constructeur
  //---------------------------------------------------------------------------

  const TableSetupResult({
    required this.players,
    required this.firstDealerPosition,
  });
}