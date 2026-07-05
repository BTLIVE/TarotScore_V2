import 'package:flutter/material.dart';

import '../models/player.dart';
import '../services/player_service.dart';
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

  Future<void> _createPlayer() async {
    final result = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (_) => const PlayerFormScreen(),
      ),
    );

    if (result == true) {
      await _loadPlayers();
    }
  }

  Future<void> _editPlayer(Player player) async {
    final result = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (_) => PlayerFormScreen(
          player: player,
        ),
      ),
    );

    if (result == true) {
      await _loadPlayers();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Joueurs'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _createPlayer,
        icon: const Icon(Icons.add),
        label: const Text('Ajouter'),
      ),
      body: _loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : _players.isEmpty
              ? const Center(
                  child: Text(
                    'Aucun joueur',
                  ),
                )
              : ListView.separated(
                  itemCount: _players.length,
separatorBuilder: (context, index) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final player = _players[index];

                    return ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          player.firstName.isNotEmpty
                              ? player.firstName[0].toUpperCase()
                              : '?',
                        ),
                      ),
                      title: Text(player.displayName),
                      subtitle: Text(player.fullName),
                      trailing: player.active
                          ? null
                          : const Icon(
                              Icons.block,
                              color: Colors.red,
                            ),
                      onTap: () => _editPlayer(player),
                    );
                  },
                ),
    );
  }
}