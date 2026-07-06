// ***************************************************************************
//
// TarotScore V2
//
// Fichier : statistics_page.dart
//
// Description : Statistiques.
//
// Auteur : David
//
// ***************************************************************************

import 'package:flutter/material.dart';

import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/app_list_tile.dart';
import '../../../../core/widgets/app_page.dart';
import '../../../../core/widgets/app_section.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Statistiques',
      child: ListView(
        children: [
          AppSection(
            title: 'Parties',
            child: AppCard(
              child: Column(
                children: [
                  AppListTile(
                    leading: const Icon(Icons.casino_outlined),
                    title: const Text('Parties jouées'),
                    trailing: const Text('0'),
                  ),
                  const Divider(height: 1),
                  AppListTile(
                    leading: const Icon(Icons.style_outlined),
                    title: const Text('Donnes jouées'),
                    trailing: const Text('0'),
                  ),
                ],
              ),
            ),
          ),
          AppSection(
            title: 'Scores',
            child: AppCard(
              child: Column(
                children: [
                  AppListTile(
                    leading: const Icon(Icons.trending_up),
                    title: const Text('Meilleur score'),
                    trailing: const Text('-'),
                  ),
                  const Divider(height: 1),
                  AppListTile(
                    leading: const Icon(Icons.trending_down),
                    title: const Text('Plus forte chute'),
                    trailing: const Text('-'),
                  ),
                ],
              ),
            ),
          ),
          AppSection(
            title: 'Contrats',
            child: AppCard(
              child: Column(
                children: [
                  AppListTile(
                    leading: const Icon(Icons.check_circle_outline),
                    title: const Text('Contrats réussis'),
                    trailing: const Text('0'),
                  ),
                  const Divider(height: 1),
                  AppListTile(
                    leading: const Icon(Icons.cancel_outlined),
                    title: const Text('Contrats chutés'),
                    trailing: const Text('0'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}