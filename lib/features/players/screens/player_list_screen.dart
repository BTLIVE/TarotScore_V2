import 'package:flutter/material.dart';

import '../models/player.dart';
import '../services/player_service.dart';
import '../presentation/widgets/player_list_tile.dart';
import 'player_form_screen.dart';

class PlayerListScreen extends StatefulWidget {
  const PlayerListScreen({super.key});

  @override
  State<PlayerListScreen> createState() => _PlayerListScreenState();
}

class _PlayerListScreenState extends State<PlayerListScreen> {
  final PlayerService _service = PlayerService.instance;

  List<Player> _players = [];

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadPlayers();
  }

  Future<void> _loadPlayers() async {
    final players = await _service.getAll();

    if (!mounted) return;

    setState(() {
      _players = players;
      _loading = false;
    });
  }

  Future<void> _addPlayer() async {
    final created = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (_) => const PlayerFormScreen(),
      ),
    );

    if (created == true) {
      await _loadPlayers();
    }
  }

  Future<void> _editPlayer(Player player) async {
    final updated = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (_) => PlayerFormScreen(
          player: player,
        ),
      ),
    );

    if (updated == true) {
      await _loadPlayers();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Joueurs'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Ajouter un joueur',
            onPressed: _addPlayer,
          ),
        ],
      ),
      body: _loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : _players.isEmpty
              ? const Center(
                  child: Text(
                    'Aucun joueur enregistré.',
                  ),
                )
              : ListView.separated(
                  itemCount: _players.length,
                  separatorBuilder: (context, index) =>
                      const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final player = _players[index];

                    return PlayerListTile(
                      player: player,
                      onTap: () => _editPlayer(player),
                    );
                  },
                ),
    );
  }
}