// ***************************************************************************
//
// TarotScore V2
//
// Fichier : current_session_page.dart
//
// Description : Partie en cours.
//
// Auteur : David
//
// ***************************************************************************

import 'package:flutter/material.dart';

import '../../../../core/widgets/app_page.dart';

class CurrentSessionPage extends StatelessWidget {
  const CurrentSessionPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const AppPage(
      title: 'Partie en cours',
      child: Center(
        child: Text(
          'Aucune partie en cours.',
        ),
      ),
    );
  }
}