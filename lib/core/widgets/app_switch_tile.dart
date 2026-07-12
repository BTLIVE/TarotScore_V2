// ***************************************************************************
//
// TarotScore V2
//
// Fichier : app_switch_tile.dart
//
// Description : Interrupteur standard de l'application.
//
// Auteur : David
//
// ***************************************************************************

import 'package:flutter/material.dart';

class AppSwitchTile extends StatelessWidget {
  const AppSwitchTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.subtitle,
  });

  //---------------------------------------------------------------------------
  // Paramètres
  //---------------------------------------------------------------------------

  final String title;

  final String? subtitle;

  final bool value;

  final ValueChanged<bool>? onChanged;

  //---------------------------------------------------------------------------
  // UI
  //---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(title),
      subtitle: subtitle != null
          ? Text(subtitle!)
          : null,
      value: value,
      onChanged: onChanged,
    );
  }
}