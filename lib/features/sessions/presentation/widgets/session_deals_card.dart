// ***************************************************************************
//
// TarotScore V2
//
// Fichier : session_deals_card.dart
//
// Description : Historique des donnes de la session.
//
// Auteur : David
//
// ***************************************************************************

import 'package:flutter/material.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_card.dart';

import '../../models/deal.dart';

class SessionDealsCard extends StatelessWidget {
  const SessionDealsCard({
    super.key,
    required this.deals,
  });

  final List<Deal> deals;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Text(
            'Historique',
            style: Theme.of(context)
                .textTheme
                .titleMedium,
          ),

          const SizedBox(
            height: AppSpacing.md,
          ),

          if (deals.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: AppSpacing.lg,
              ),
              child: Center(
                child: Text(
                  'Aucune donne jouée.',
                ),
              ),
            )
          else
            ListView.separated(
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(),

              // Affichage de la plus récente à la plus ancienne
              itemCount: deals.length,

              separatorBuilder:
                  (_, _) => const Divider(
                height: 1,
              ),

              itemBuilder: (
                context,
                index,
              ) {
                final deal = deals[
                    deals.length -
                        1 -
                        index];

                final contract =
                    deal.contractId
                        .replaceAll(
                          '_',
                          ' ',
                        );

                return ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      '${deal.number}',
                    ),
                  ),

                  title: Text(
                    contract[0]
                            .toUpperCase() +
                        contract.substring(1),
                  ),

                  subtitle: Text(
                    '${deal.points} points'
                    ' • '
                    '${deal.oudlers} bout'
                    '${deal.oudlers > 1 ? 's' : ''}'
                    '\n'
                    '${deal.hasCalledPartner ? 'Avec appelé' : 'Preneur seul'}',
                  ),

                  isThreeLine:
                      deal.hasCalledPartner,

                  trailing: Icon(
                    deal.hasCalledPartner
                        ? Icons.people
                        : Icons.person,
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}