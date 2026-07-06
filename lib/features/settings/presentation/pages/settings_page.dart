// ***************************************************************************
//
// TarotScore V2
//
// Fichier : settings_page.dart
//
// Description : Paramètres de l'application.
//
// Auteur : David
//
// ***************************************************************************

import 'package:flutter/material.dart';

import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/app_list_tile.dart';
import '../../../../core/widgets/app_page.dart';
import '../../../../core/widgets/app_section.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Paramètres',
      child: ListView(
        children: [
          AppSection(
            title: 'Application',
            child: AppCard(
              child: Column(
                children: [
                  AppListTile(
                    leading: const Icon(Icons.palette_outlined),
                    title: const Text('Apparence'),
                    subtitle: const Text(
                      'À venir',
                    ),
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  AppListTile(
                    leading: const Icon(Icons.language_outlined),
                    title: const Text('Langue'),
                    subtitle: const Text(
                      'Français',
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
          AppSection(
            title: 'Parties',
            child: AppCard(
              child: Column(
                children: [
                  AppListTile(
                    leading: const Icon(Icons.rule_folder_outlined),
                    title: const Text('Profils de règles'),
                    subtitle: const Text(
                      'FFT Officiel',
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
          AppSection(
            title: 'Informations',
            child: AppCard(
              child: Column(
                children: [
                  AppListTile(
                    leading: const Icon(Icons.info_outline),
                    title: const Text('À propos'),
                    onTap: () {},
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