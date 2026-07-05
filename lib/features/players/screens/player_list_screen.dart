import 'package:flutter/material.dart';

import '../../../core/widgets/app_page.dart';
import '../models/player.dart';
import '../services/player_service.dart';
import '../widgets/player_tile.dart';

class PlayerListScreen extends StatefulWidget {
  const PlayerListScreen({super.key});

  @override
  State<PlayerListScreen> createState() => _PlayerListScreenState();
}

class _PlayerListScreenState extends State<PlayerListScreen> {
  final PlayerService _playerService = PlayerService.instance;

  late Future<List<Player>> _playersFuture;

  @override
  void initState() {
    super.initState();
    _loadPlayers();
  }

  void _loadPlayers() {
    _playersFuture = _playerService.getPlayers();
  }

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Joueurs',

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO : ouvrir le formulaire d'ajout
        },
        child: const Icon(Icons.add),
      ),

      body: FutureBuilder<List<Player>>(
        future: _playersFuture,
        builder: (context, snapshot) {
          // Chargement
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // Erreur
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Erreur : ${snapshot.error}',
              ),
            );
          }

          final players = snapshot.data ?? [];

          // Aucun joueur
          if (players.isEmpty) {
            return const Center(
              child: Text(
                'Aucun joueur enregistré',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            );
          }

          // Liste des joueurs
          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: players.length,
            itemBuilder: (context, index) {
              final player = players[index];

              return PlayerTile(
                player: player,
                onTap: () {
                  // TODO : modification du joueur
                },
              );
            },
          );
        },
      ),
    );
  }
}