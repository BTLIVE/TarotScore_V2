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

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/app_page.dart';
import '../../../../core/widgets/app_section.dart';

class NewSessionPage extends StatelessWidget {
  const NewSessionPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Nouvelle partie',
      child: ListView(
        children: [
          AppSection(
            title: 'Profil de règles',
            child: AppCard(
              child: const Text(
                'FFT Officiel',
              ),
            ),
          ),

          AppSection(
            title: 'Joueurs',
            child: AppCard(
              child: const Text(
                'Aucun joueur sélectionné',
              ),
            ),
          ),

          AppSection(
            title: 'Premier donneur',
            child: AppCard(
              child: const Text(
                'Aucun',
              ),
            ),
          ),

          const SizedBox(
            height: AppSpacing.xl,
          ),

          AppButton(
            label: 'Créer la partie',
            onPressed: null,
          ),
        ],
      ),
    );
  }
}