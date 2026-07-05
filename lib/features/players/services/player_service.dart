// ***************************************************************************
// TarotScore V2
//
// Fichier : player_service.dart
//
// Description : Service métier des joueurs.
//
// Auteur : David
// Création : 05/07/2026
// ***************************************************************************

import 'package:uuid/uuid.dart';

import '../models/player.dart';
import '../repositories/player_repository.dart';

class PlayerService {
  PlayerService._();

  static final PlayerService instance = PlayerService._();

  final PlayerRepository _repository = PlayerRepository.instance;

  /// Retourne tous les joueurs.
  Future<List<Player>> getAll() async {
    return await _repository.getAll();
  }

  /// Retourne uniquement les joueurs actifs.
  Future<List<Player>> getActive() async {
    return await _repository.getActive();
  }

  /// Recherche un joueur par son identifiant.
  Future<Player?> getById(int id) async {
    return await _repository.getById(id);
  }

  /// Recherche un joueur par son UUID.
  Future<Player?> getByUuid(String uuid) async {
    return await _repository.getByUuid(uuid);
  }

  /// Création d'un nouveau joueur.
  Future<int> create({
    required String firstName,
    required String lastName,
    String? nickname,
    String? email,
    String? mobilePhone,
    DateTime? birthDate,
    String? comments,
    String avatarId = 'default_01',
    String? photoFileName,
    bool active = true,
  }) async {
    final now = DateTime.now();

    final player = Player(
      uuid: const Uuid().v4(),
      firstName: firstName.trim(),
      lastName: lastName.trim(),
      nickname: _normalize(nickname),
      email: _normalize(email),
      mobilePhone: _normalize(mobilePhone),
      birthDate: birthDate,
      comments: _normalize(comments),
      avatarId: avatarId,
      photoFileName: photoFileName,
      active: active,
      createdAt: now,
      updatedAt: now,
    );

    return await _repository.insert(player);
  }

  /// Mise à jour d'un joueur.
  Future<int> update(Player player) async {
    player.updatedAt = DateTime.now();

    return await _repository.update(player);
  }

  /// Désactive un joueur.
  Future<void> deactivate(Player player) async {
    if (player.id == null) {
      return;
    }

    await _repository.deactivate(player.id!);
  }

  /// Réactive un joueur.
  Future<void> reactivate(Player player) async {
    if (player.id == null) {
      return;
    }

    await _repository.reactivate(player.id!);
  }

  /// Active ou désactive un joueur.
  Future<void> setActive(
    Player player,
    bool active,
  ) async {
    if (player.id == null) {
      return;
    }

    player.active = active;
    player.updatedAt = DateTime.now();

    await _repository.setActive(
      player.id!,
      active,
    );
  }

  /// Suppression définitive.
  Future<void> delete(Player player) async {
    if (player.id == null) {
      return;
    }

    await _repository.delete(player.id!);
  }

  /// Nettoie une chaîne de caractères.
  String? _normalize(String? value) {
    if (value == null) {
      return null;
    }

    final trimmed = value.trim();

    if (trimmed.isEmpty) {
      return null;
    }

    return trimmed;
  }
}