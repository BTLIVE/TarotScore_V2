// ***************************************************************************
//
// TarotScore V2
//
// Fichier : rule_name_field.dart
//
// Description : Champ de texte pour le nom d'une règle.
//
// Auteur : David
//
// ***************************************************************************

import 'package:flutter/material.dart';

class RuleNameField extends StatelessWidget {
  const RuleNameField({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final String value;

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: value,

      decoration: const InputDecoration(
        labelText: 'Nom',
      ),

      onChanged: onChanged,
    );
  }
}