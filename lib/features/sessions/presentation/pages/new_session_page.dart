// ***************************************************************************
//
// TarotScore V2
//
// Fichier : new_session_page.dart
//
// Description : Création d'une nouvelle partie.
//
// Auteur : David
//
// ***************************************************************************

import 'package:flutter/material.dart';

import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/app_page.dart';
import '../../../../core/widgets/app_section.dart';

import '../../../players/services/player_service.dart';
import '../../../rules/factories/official_rule_profiles.dart';

import '../../models/session_player.dart';
import '../../models/table_setup_result.dart';

import '../../services/session_service.dart';

import 'table_setup_page.dart';
import '../widgets/player_selection_card.dart';

class NewSessionPage extends StatefulWidget {
  const NewSessionPage({
    super.key,
  });

  @override
  State<NewSessionPage> createState() =>
      _NewSessionPageState();
}

class _NewSessionPageState
    extends State<NewSessionPage> {
  //---------------------------------------------------------------------------
  // Dépendances
  //---------------------------------------------------------------------------

  final PlayerService _playerService =
      PlayerService.instance;

  final SessionService _sessionService =
      SessionService.instance;

  //---------------------------------------------------------------------------
  // Etat
  //---------------------------------------------------------------------------

  List<SessionPlayer> _players = [];

  bool _loading = true;

  //---------------------------------------------------------------------------
  // Lifecycle
  //---------------------------------------------------------------------------

  @override
  void initState() {
    super.initState();

    _loadPlayers();
  }

  Future<void> _loadPlayers() async {
    final players =
        await _playerService.getActive();

    if (!mounted) {
      return;
    }

    setState(() {
      _players = players
          .map(
            (player) => SessionPlayer(
              player: player,
            ),
          )
          .toList();

      _loading = false;
    });
  }

  //---------------------------------------------------------------------------
  // Rafraîchissement
  //---------------------------------------------------------------------------

  void _refresh() {
    setState(() {});
  }

  //---------------------------------------------------------------------------
  // Création
  //---------------------------------------------------------------------------

  Future<void> _startSession() async {
    final selectedPlayers = _players
        .where((p) => p.selected)
        .map((p) => p.player)
        .toList(growable: false);

    final result =
        await Navigator.push<TableSetupResult>(
      context,
      MaterialPageRoute(
        builder: (_) => TableSetupPage(
          players: selectedPlayers,
        ),
      ),
    );

    if (!mounted || result == null) {
      return;
    }

    _sessionService.start(
      ruleProfile:
          OfficialRuleProfiles.fft(),
      players: result.players,
      firstDealerPosition:
          result.firstDealerPosition,
    );

    if (!mounted) {
      return;
    }

    Navigator.pushReplacementNamed(
      context,
      AppRoutes.currentSession,
    );
  }

  //---------------------------------------------------------------------------
  // Validation
  //---------------------------------------------------------------------------

  bool get _canCreate =>
      _players
              .where((p) => p.selected)
              .length >=
          3;

  //---------------------------------------------------------------------------
  // UI
  //---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Nouvelle partie',
      child: _loading
          ? const Center(
              child:
                  CircularProgressIndicator(),
            )
          : ListView(
              children: [
                AppSection(
                  title: 'Profil de règles',
                  child: AppCard(
                    child: Text(
                      OfficialRuleProfiles
                          .fft()
                          .name,
                    ),
                  ),
                ),

                AppSection(
                  title: 'Joueurs',
                  child: PlayerSelectionCard(
                    players: _players,
                    onChanged: _refresh,
                  ),
                ),

                const SizedBox(
                  height: AppSpacing.xl,
                ),

                AppButton(
                  label: 'Suivant',
                  onPressed: _canCreate
                      ? _startSession
                      : null,
                ),
              ],
            ),
    );
  }
}