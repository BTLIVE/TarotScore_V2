// ***************************************************************************
//
// TarotScore V2
//
// Fichier : score_board_card.dart
//
// Description : Tableau des scores de la session.
//
// Auteur : David
//
// ***************************************************************************

import 'package:flutter/material.dart';

import '../../../../core/widgets/app_card.dart';
import '../../models/player_score.dart';
import '../../models/session_state.dart';

class ScoreBoardCard extends StatelessWidget {
  const ScoreBoardCard({
    super.key,
    required this.state,
  });

  final SessionState state;

  @override
  Widget build(BuildContext context) {
    final players = state.session.players;
    final scores = state.playerScores;

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Scores',
            style: Theme.of(context).textTheme.titleMedium,
          ),

          const SizedBox(height: 12),

          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: players.length,
            separatorBuilder: (context, index) =>
                const Divider(height: 1),
            itemBuilder: (context, index) {
              final player = players[index];
              final PlayerScore score = scores[index];

              return ListTile(
                dense: true,
                leading: CircleAvatar(
                  child: Text(
                    '${index + 1}',
                  ),
                ),
                title: Text(
                  '${player.firstName} ${player.lastName}',
                ),
                trailing: Text(
                  '${score.totalScore}',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
