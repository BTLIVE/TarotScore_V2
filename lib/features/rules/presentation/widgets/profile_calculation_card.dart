// ***************************************************************************
//
// TarotScore V2
//
// Fichier : profile_calculation_card.dart
//
// Description : Paramètres généraux de calcul d'un profil.
//
// Auteur : David
//
// ***************************************************************************

import 'package:flutter/material.dart';

import '../../../../core/widgets/app_card.dart';

import '../../models/rule_profile.dart';

class ProfileCalculationCard extends StatelessWidget {
  const ProfileCalculationCard({
    super.key,
    required this.profile,
    required this.onChanged,
  });

  //---------------------------------------------------------------------------
  // Paramètres
  //---------------------------------------------------------------------------

  final RuleProfile profile;

  final ValueChanged<RuleProfile> onChanged;

  //---------------------------------------------------------------------------
  // UI
  //---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return const AppCard(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          'Options de calcul\n\n'
          'Cette section sera implémentée '
          'dans le prochain lot.',
        ),
      ),
    );
  }
}