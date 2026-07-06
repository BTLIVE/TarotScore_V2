// ***************************************************************************
//
// TarotScore V2
//
// Fichier : player_form_page.dart
//
// Description : Création / modification d'un joueur.
//
// Auteur : David
//
// ***************************************************************************

import 'package:flutter/material.dart';

import '../../../../core/widgets/app_page.dart';
import '../../models/player.dart';
import '../widgets/player_form.dart';

class PlayerFormPage extends StatefulWidget {
  final Player? player;

  const PlayerFormPage({
    super.key,
    this.player,
  });

  @override
  State<PlayerFormPage> createState() =>
      _PlayerFormPageState();
}

class _PlayerFormPageState
    extends State<PlayerFormPage> {
  final GlobalKey<PlayerFormState> _formKey =
      GlobalKey<PlayerFormState>();

  Future<void> _save() async {
    final saved =
        await _formKey.currentState?.save() ?? false;

    if (!mounted || !saved) {
      return;
    }

    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: widget.player == null
          ? 'Nouveau joueur'
          : 'Modifier un joueur',

      actions: [
        IconButton(
          icon: const Icon(Icons.save),
          tooltip: 'Enregistrer',
          onPressed: _save,
        ),
      ],

      child: PlayerForm(
        key: _formKey,
        player: widget.player,
      ),
    );
  }
}