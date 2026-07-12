// ***************************************************************************
//
// TarotScore V2
//
// Fichier : rule_value_field.dart
//
// Description : Champ numérique réutilisable.
//
// Auteur : David
//
// ***************************************************************************

import 'package:flutter/material.dart';

class RuleValueField extends StatelessWidget {
  const RuleValueField({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.min = 0,
    this.max = 999,
  });

  final String label;
  final int value;
  final int min;
  final int max;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(label),
        ),
        IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          onPressed: value > min
              ? () => onChanged(value - 1)
              : null,
        ),
        SizedBox(
          width: 36,
          child: Text(
            '$value',
            textAlign: TextAlign.center,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.add_circle_outline),
          onPressed: value < max
              ? () => onChanged(value + 1)
              : null,
        ),
      ],
    );
  }
}