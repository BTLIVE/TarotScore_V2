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
import '../../services/session_service.dart';

import '../widgets/dealer_selection_card.dart';
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
  final PlayerService _playerService =
      PlayerService.instance;

  final SessionService _sessionService =
      SessionService.instance;

  List<SessionPlayer> _players = [];

  SessionPlayer? _dealer;

  bool _loading = true;

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

  void _refresh() {
    if (_dealer != null &&
        !_dealer!.selected) {
      _dealer = null;
    }

    setState(() {});
  }

  Future<void> _startSession() async {
    if (_dealer == null) {
      return;
    }

    final selectedPlayers = _players
        .where((p) => p.selected)
        .toList();

    final dealerPosition =
        selectedPlayers.indexOf(_dealer!);

    _sessionService.start(
      ruleProfile:
          OfficialRuleProfiles.fft(),
      players: selectedPlayers
          .map((p) => p.player)
          .toList(),
      firstDealerPosition:
          dealerPosition,
    );

    if (!mounted) {
      return;
    }

    Navigator.pushReplacementNamed(
      context,
      AppRoutes.currentSession,
    );
  }

  bool get _canCreate =>
      _dealer != null &&
      _players
              .where((p) => p.selected)
              .length >=
          3;

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

                AppSection(
                  title: 'Premier donneur',
                  child: DealerSelectionCard(
                    players: _players,
                    dealer: _dealer,
                    onDealerChanged:
                        (player) {
                      setState(() {
                        _dealer = player;
                      });
                    },
                  ),
                ),

                const SizedBox(
                  height: AppSpacing.xl,
                ),

                AppButton(
                  label:
                      'Créer la partie',
                  onPressed: _canCreate
                      ? _startSession
                      : null,
                ),
              ],
            ),
    );
  }
}