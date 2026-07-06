import 'package:flutter/material.dart';

import '../models/player.dart';
import '../presentation/widgets/player_form.dart';

class PlayerFormScreen extends StatefulWidget {
  const PlayerFormScreen({
    super.key,
    this.player,
  });

  /// null = création
  /// non null = modification
  final Player? player;

  @override
  State<PlayerFormScreen> createState() => _PlayerFormScreenState();
}

class _PlayerFormScreenState extends State<PlayerFormScreen> {
  final _formKey = GlobalKey<PlayerFormState>();

  bool get isCreation => widget.player == null;

  Future<void> _save() async {
    final success = await _formKey.currentState?.save();

    if (success == true && mounted) {
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isCreation
              ? 'Nouveau joueur'
              : 'Modifier le joueur',
        ),
        actions: [
          IconButton(
            tooltip: 'Enregistrer',
            icon: const Icon(Icons.save),
            onPressed: _save,
          ),
        ],
      ),
      body: PlayerForm(
        key: _formKey,
        player: widget.player,
      ),
    );
  }
}