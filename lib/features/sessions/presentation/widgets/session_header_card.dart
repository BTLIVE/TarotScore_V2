// ***************************************************************************
//
// TarotScore V2
//
// Fichier : session_header_card.dart
//
// Description : Résumé de la session en cours.
//
// Auteur : David
//
// ***************************************************************************

import 'package:flutter/material.dart';

import '../../../../core/widgets/app_card.dart';
import '../../models/session_state.dart';

class SessionHeaderCard extends StatelessWidget {
  const SessionHeaderCard({
    super.key,
    required this.state,
  });

  final SessionState state;

  @override
  Widget build(BuildContext context) {
    final session = state.session;

    final dealer = session.players[
        state.nextDealerPosition];

    return AppCard(
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Text(
            session.ruleProfile.name,
            style: Theme.of(context)
                .textTheme
                .titleMedium,
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              const Icon(Icons.people),
              const SizedBox(width: 8),
              Text(
                '${session.playerCount} joueurs',
              ),
            ],
          ),

          const SizedBox(height: 8),

          Row(
            children: [
              const Icon(Icons.casino),
              const SizedBox(width: 8),
              Text(
                'Donne n°${state.nextDealNumber}',
              ),
            ],
          ),

          const SizedBox(height: 8),

          Row(
            children: [
              const Icon(Icons.person),
              const SizedBox(width: 8),
              Text(
                'Donneur : '
                '${dealer.firstName} ${dealer.lastName}',
              ),
            ],
          ),
        ],
      ),
    );
  }
}