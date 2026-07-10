// ***************************************************************************
//
// TarotScore V2
//
// Fichier : deal_result_dialog.dart
//
// Description : Confirmation d'une donne.
//
// Auteur : David
//
// ***************************************************************************

import 'package:flutter/material.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_card.dart';

import '../../../players/models/player.dart';
import '../../../rules/engine/pipeline/deal_calculation.dart';

class DealResultDialog extends StatelessWidget {
  final DealCalculation calculation;

  final List<Player> players;

  const DealResultDialog({
    super.key,
    required this.calculation,
    required this.players,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Résultat de la donne',
      ),
      content: SizedBox(
        width: 420,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.stretch,
            children: [
              //----------------------------------------------------------------
              // Calcul
              //----------------------------------------------------------------

              AppCard(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Calcul',
                      style: TextStyle(
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(
                      height: AppSpacing.md,
                    ),

                    _line(
                      'Contrat',
                      calculation.deal.contractId,
                    ),

                    _line(
                      'Objectif',
                      calculation.target?.toString() ??
                          '-',
                    ),

                    _line(
                      'Points',
                      calculation.deal.points
                          .toString(),
                    ),

                    _line(
                      'Écart',
                      calculation
                              .difference
                              ?.toStringAsFixed(1) ??
                          '-',
                    ),

                    const Divider(),

                    _line(
                      'Score de base',
                      calculation.baseScore
                              ?.toString() ??
                          '-',
                    ),

                    _line(
                      'Multiplicateur',
                      calculation.contractMultiplier ==
                              null
                          ? '-'
                          : '×${calculation.contractMultiplier}',
                    ),

                    _line(
                      'Score contrat',
                      calculation.contractScore
                              ?.toString() ??
                          '-',
                    ),

                    _line(
                      'Score final',
                      calculation.finalScore
                              ?.toString() ??
                          '-',
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: AppSpacing.lg,
              ),

              //----------------------------------------------------------------
              // Bonus appliqués
              //----------------------------------------------------------------

              if (calculation
                  .appliedBonuses.isNotEmpty) ...[
                AppCard(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Bonus appliqués',
                        style: TextStyle(
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      const SizedBox(
                        height: AppSpacing.md,
                      ),

                      ..._buildBonuses(),
                    ],
                  ),
                ),

                const SizedBox(
                  height: AppSpacing.lg,
                ),
              ],

              //----------------------------------------------------------------
              // Répartition
              //----------------------------------------------------------------

              AppCard(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Répartition',
                      style: TextStyle(
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(
                      height: AppSpacing.md,
                    ),

                    ..._buildScores(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(
              context,
              false,
            );
          },
          child: const Text(
            'Modifier',
          ),
        ),
        FilledButton(
          onPressed: () {
            Navigator.pop(
              context,
              true,
            );
          },
          child: const Text(
            'Valider',
          ),
        ),
      ],
    );
  }

  //---------------------------------------------------------------------------
  // Ligne
  //---------------------------------------------------------------------------

  Widget _line(
    String label,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 2,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(label),
          ),
          Text(value),
        ],
      ),
    );
  }

  //---------------------------------------------------------------------------
  // Bonus
  //---------------------------------------------------------------------------

  List<Widget> _buildBonuses() {
    return calculation.appliedBonuses.map(
      (bonus) {
        final label = bonus.hasDescription
            ? '${bonus.name} (${bonus.description})'
            : bonus.name;

        return Padding(
          padding:
              const EdgeInsets.symmetric(
            vertical: 2,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(label),
              ),
              Text(
                bonus.value > 0
                    ? '+${bonus.value}'
                    : '${bonus.value}',
              ),
            ],
          ),
        );
      },
    ).toList();
  }

  //---------------------------------------------------------------------------
  // Scores
  //---------------------------------------------------------------------------

  List<Widget> _buildScores() {
    final scores =
        calculation.playerScores;

    if (scores == null) {
      return const [
        Text(
          'Aucun score calculé.',
        ),
      ];
    }

    return scores.entries.map((entry) {
      final player =
          players[entry.key];

      return Padding(
        padding:
            const EdgeInsets.symmetric(
          vertical: 2,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                player.displayName,
              ),
            ),
            Text(
              entry.value > 0
                  ? '+${entry.value}'
                  : '${entry.value}',
            ),
          ],
        ),
      );
    }).toList();
  }
}