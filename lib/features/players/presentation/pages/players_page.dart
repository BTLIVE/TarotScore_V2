// ***************************************************************************
//
// TarotScore V2
//
// Fichier : players_page.dart
//
// Description : Gestion des joueurs.
//
// Auteur : David
//
// ***************************************************************************

import 'package:flutter/material.dart';

import '../../../../core/widgets/app_page.dart';
import '../../models/player.dart';
import '../controllers/players_controller.dart';
import '../widgets/player_list_tile.dart';
import 'player_form_page.dart';

class PlayersPage extends StatefulWidget {
  const PlayersPage({
    super.key,
  });

  @override
  State<PlayersPage> createState() =>
      _PlayersPageState();
}

class _PlayersPageState
    extends State<PlayersPage> {
  final PlayersController controller =
      PlayersController();

  late Future<List<Player>> _playersFuture;

  @override
  void initState() {
    super.initState();
    _reload();
  }

  void _reload() {
    _playersFuture = controller.loadPlayers();
  }

  Future<void> _createPlayer() async {
    final created =
        await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (_) => const PlayerFormPage(),
      ),
    );

    if (!mounted || created != true) {
      return;
    }

    setState(() {
      _reload();
    });
  }

  Future<void> _editPlayer(
    Player player,
  ) async {
    final updated =
        await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (_) => PlayerFormPage(
          player: player,
        ),
      ),
    );

    if (!mounted || updated != true) {
      return;
    }

    setState(() {
      _reload();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Joueurs',

      floatingActionButton: FloatingActionButton(
        onPressed: _createPlayer,
        child: const Icon(Icons.add),
      ),

      child: FutureBuilder<List<Player>>(
        future: _playersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return const Center(
              child:
                  CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          }

          final players =
              snapshot.data ?? const <Player>[];

          if (players.isEmpty) {
            return const Center(
              child: Text(
                'Aucun joueur.',
              ),
            );
          }

          return ListView.separated(
            itemCount: players.length,

            separatorBuilder: (_, __) =>
                const Divider(height: 1),

            itemBuilder: (context, index) {
              final player = players[index];

              return PlayerListTile(
                player: player,
                onTap: () => _editPlayer(player),
              );
            },
          );
        },
      ),
    );
  }
}