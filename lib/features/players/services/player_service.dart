import 'package:uuid/uuid.dart';

import '../models/player.dart';
import '../repositories/player_repository.dart';

/// Service de gestion des joueurs.
///
/// Contient les règles métier.
/// Les écrans ne doivent jamais accéder directement au repository.
class PlayerService {
  PlayerService._();

  static final PlayerService instance = PlayerService._();

  final PlayerRepository _repository = PlayerRepository();

  /// Retourne tous les joueurs.
  Future<List<Player>> getPlayers() {
    return _repository.getAll();
  }

  /// Retourne uniquement les joueurs actifs.
  Future<List<Player>> getActivePlayers() {
    return _repository.getActive();
  }

  /// Recherche un joueur par son identifiant.
  Future<Player?> getPlayer(int id) {
    return _repository.getById(id);
  }

  /// Création d'un nouveau joueur.
  Future<int> createPlayer({
    required String firstName,
    required String lastName,
    String? nickname,
    String? email,
    String? phone,
    String? avatar,
  }) async {
    final now = DateTime.now();

    final player = Player(
      uuid: const Uuid().v4(),
      firstName: firstName.trim(),
      lastName: lastName.trim(),
      nickname: nickname?.trim(),
      email: email?.trim(),
      phone: phone?.trim(),
      avatar: avatar,
      active: true,
      createdAt: now,
      updatedAt: now,
    );

    return _repository.insert(player);
  }

  /// Mise à jour d'un joueur.
  Future<void> updatePlayer(Player player) async {
    final updatedPlayer = player.copyWith(
      updatedAt: DateTime.now(),
    );

    await _repository.update(updatedPlayer);
  }

  /// Désactive un joueur.
  Future<void> deactivatePlayer(int id) async {
    await _repository.deactivate(id);
  }

  /// Supprime définitivement un joueur.
  Future<void> deletePlayer(int id) async {
    await _repository.delete(id);
  }
}
