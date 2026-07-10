// ***************************************************************************
//
// TarotScore V2
//
// Fichier : table_setup_page.dart
//
// Description : Configuration de la table avant le début d'une partie.
//
// Auteur : David
//
// ***************************************************************************

import 'package:flutter/material.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/app_page.dart';
import '../../../../core/widgets/app_section.dart';

import '../../../players/models/player.dart';

import '../../models/table_setup_result.dart';

class TableSetupPage extends StatefulWidget {
  const TableSetupPage({
    super.key,
    required this.players,
  });

  /// Joueurs participant à la partie.
  final List<Player> players;

  @override
  State<TableSetupPage> createState() =>
      _TableSetupPageState();
}

class _TableSetupPageState
    extends State<TableSetupPage> {
  //---------------------------------------------------------------------------
  // Etat
  //---------------------------------------------------------------------------

  /// Ordre actuel des joueurs.
  late final List<Player> _players;

  /// Premier donneur.
  late Player _dealer;

  //---------------------------------------------------------------------------
  // Lifecycle
  //---------------------------------------------------------------------------

  @override
  void initState() {
    super.initState();

    _players = List<Player>.from(
      widget.players,
    );

    _dealer = _players.first;
  }

  //---------------------------------------------------------------------------
  // UI
  //---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Configuration de la table',
      child: ListView(
        padding: const EdgeInsets.all(
          AppSpacing.lg,
        ),
        children: [
          //------------------------------------------------------------------
          // Ordre des joueurs
          //------------------------------------------------------------------

          AppSection(
            title:
                'Disposition autour de la table',
            child: AppCard(
              child: SizedBox(
                height:
                    (_players.length * 56.0) +
                        20,
                child:
                    ReorderableListView.builder(
                  buildDefaultDragHandles:
                      true,
                  itemCount:
                      _players.length,
                  onReorder:
                      _onReorder,
                  itemBuilder:
                      (
                        context,
                        index,
                      ) {
                    final player =
                        _players[index];

                    return ListTile(
                      key: ValueKey(
                        player.uuid,
                      ),
                      leading:
                          CircleAvatar(
                        child: Text(
                          '${index + 1}',
                        ),
                      ),
                      title: Text(
                        player.displayName,
                      ),
                      trailing:
                          const Icon(
                        Icons.drag_handle,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          //------------------------------------------------------------------
          // Premier donneur
          //------------------------------------------------------------------

          AppSection(
            title:
                'Premier donneur',
            child: AppCard(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment
                        .start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.fromLTRB(
                      AppSpacing.md,
                      AppSpacing.md,
                      AppSpacing.md,
                      AppSpacing.sm,
                    ),
                    child: Text(
                      'Choisissez le premier donneur. '
                      'La rotation sera ensuite automatique '
                      'pendant toute la partie.',
                      style:
                          Theme.of(context)
                              .textTheme
                              .bodySmall,
                    ),
                  ),
                  ..._players.map(
                    (player) =>
                        RadioListTile<Player>(
                      value: player,
                      groupValue:
                          _dealer,
                      title: Text(
                        player.displayName,
                      ),
                      onChanged:
                          (value) {
                        if (value !=
                            null) {
                          setState(() {
                            _dealer =
                                value;
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(
            height: AppSpacing.xl,
          ),

          //------------------------------------------------------------------
          // Validation
          //------------------------------------------------------------------

          AppButton(
            label: 'Créer la partie',
            onPressed: () {
              Navigator.pop(
                context,
                TableSetupResult(
                  players:
                      List<Player>.unmodifiable(
                    _players,
                  ),
                  firstDealerPosition:
                      _players.indexOf(
                    _dealer,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  //---------------------------------------------------------------------------
  // Réorganisation
  //---------------------------------------------------------------------------

  void _onReorder(
    int oldIndex,
    int newIndex,
  ) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex--;
      }

      final player =
          _players.removeAt(
        oldIndex,
      );

      _players.insert(
        newIndex,
        player,
      );
    });
  }
}