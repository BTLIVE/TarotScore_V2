// ***************************************************************************
//
// TarotScore V2
//
// Fichier : session_score_card.dart
//
// Description : Classement courant de la session.
//
// Auteur : David
//
// ***************************************************************************

import 'package:flutter/material.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_card.dart';

import '../../models/player_score.dart';
import '../../models/session.dart';

class SessionScoreCard extends StatelessWidget {
  const SessionScoreCard({
    super.key,
    required this.session,
    required this.playerScores,
  });

  final Session session;

  final List<PlayerScore> playerScores;

  @override
  Widget build(BuildContext context) {
    final ranking = [...playerScores];

    ranking.sort(
      (a, b) => b.totalScore.compareTo(
        a.totalScore,
      ),
    );

    return AppCard(
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Text(
            'Classement',
            style: Theme.of(context)
                .textTheme
                .titleMedium,
          ),

          const SizedBox(
            height: AppSpacing.md,
          ),

          ListView.separated(
            shrinkWrap: true,
            physics:
                const NeverScrollableScrollPhysics(),
            itemCount: ranking.length,
            separatorBuilder:
                (_, _) => const Divider(
              height: 1,
            ),
            itemBuilder: (
              context,
              index,
            ) {
              final score =
                  ranking[index];

              final player =
                  session.players[
                      score.playerPosition];

              return ListTile(
                dense: true,

                contentPadding:
                    EdgeInsets.zero,

                leading: Text(
                  switch (index) {
                    0 => '🥇',
                    1 => '🥈',
                    2 => '🥉',
                    _ => '${index + 1}',
                  },
                  style:
                      const TextStyle(
                    fontSize: 20,
                  ),
                ),

                title: Text(
                  '${player.firstName} ${player.lastName}',
                ),

                trailing: Text(
                  '${score.totalScore}',
                  style:
                      Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(
                            fontWeight:
                                FontWeight.bold,
                          ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}