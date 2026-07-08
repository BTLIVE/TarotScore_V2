// ***************************************************************************
//
// TarotScore V2
//
// Fichier : deal_history_card.dart
//
// Description : Historique des donnes.
//
// Auteur : David
//
// ***************************************************************************

import 'package:flutter/material.dart';

import '../../../../core/widgets/app_card.dart';
import '../../models/session_state.dart';

class DealHistoryCard extends StatelessWidget {
  const DealHistoryCard({
    super.key,
    required this.state,
  });

  final SessionState state;

  @override
  Widget build(BuildContext context) {
    final deals = state.session.deals;

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Historique',
            style: Theme.of(context)
                .textTheme
                .titleMedium,
          ),

          const SizedBox(height: 12),

          if (deals.isEmpty)
            const ListTile(
              leading: Icon(Icons.inbox_outlined),
              title: Text(
                'Aucune donne jouée.',
              ),
            )
          else
            ListView.separated(
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(),
              itemCount: deals.length,
              separatorBuilder: (context, index) =>
                  const Divider(height: 1),
              itemBuilder: (context, index) {
                final deal = deals[index];

                return ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      '${index + 1}',
                    ),
                  ),
                  title: Text(
                    'Donne n°${deal.number}',
                  ),
                  subtitle: const Text(
                    'Voir le détail',
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                  ),
                  onTap: () {
                    // Sprint 8
                  },
                );
              },
            ),
        ],
      ),
    );
  }
}