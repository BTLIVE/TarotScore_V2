// ***************************************************************************
//
// TarotScore V2
//
// Fichier : app_text_field.dart
//
// Description : Champ de saisie standard de l'application.
//
// Auteur : David
//
// ***************************************************************************

import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    required this.label,
    this.hint,
    this.enabled = true,
    this.maxLines = 1,
    this.keyboardType,
    this.onChanged,
  });

  //---------------------------------------------------------------------------
  // Paramètres
  //---------------------------------------------------------------------------

  final TextEditingController controller;

  final String label;

  final String? hint;

  final bool enabled;

  final int maxLines;

  final TextInputType? keyboardType;

  final ValueChanged<String>? onChanged;

  //---------------------------------------------------------------------------
  // UI
  //---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enabled: enabled,
      maxLines: maxLines,
      keyboardType: keyboardType,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: const OutlineInputBorder(),
      ),
    );
  }
}