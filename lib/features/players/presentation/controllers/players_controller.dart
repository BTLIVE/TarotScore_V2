// ***************************************************************************
//
// TarotScore V2
//
// Fichier : players_controller.dart
//
// Description : Contrôleur de la liste des joueurs.
//
// Auteur : David
//
// ***************************************************************************

import '../../models/player.dart';
import '../../services/player_service.dart';

class PlayersController {
  PlayersController();

  final PlayerService _playerService =
      PlayerService.instance;

  Future<List<Player>> loadPlayers() {
    return _playerService.getActive();
  }

  Future<void> deactivate(
    Player player,
  ) {
    return _playerService.deactivate(player);
  }

  Future<void> reactivate(
    Player player,
  ) {
    return _playerService.reactivate(player);
  }

  Future<void> delete(
    Player player,
  ) {
    return _playerService.delete(player);
  }
}