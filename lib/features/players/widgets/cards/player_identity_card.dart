import 'package:flutter/material.dart';

import '../../../../core/widgets/section_card.dart';

class PlayerIdentityCard extends StatelessWidget {
  const PlayerIdentityCard({
    super.key,
    required this.lastNameController,
    required this.firstNameController,
    required this.nicknameController,
    required this.active,
    required this.onActiveChanged,
    this.lastNameValidator,
    this.firstNameValidator,
  });

  final TextEditingController lastNameController;
  final TextEditingController firstNameController;
  final TextEditingController nicknameController;

  final bool active;
  final ValueChanged<bool> onActiveChanged;

  final FormFieldValidator<String>? lastNameValidator;
  final FormFieldValidator<String>? firstNameValidator;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'Informations générales',
      icon: Icons.person,
      child: Column(
        children: [
          TextFormField(
            controller: lastNameController,
            validator: lastNameValidator,
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              labelText: 'Nom *',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: firstNameController,
            validator: firstNameValidator,
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              labelText: 'Prénom *',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: nicknameController,
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              labelText: 'Surnom',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 8),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Joueur actif'),
            value: active,
            onChanged: onActiveChanged,
          ),
        ],
      ),
    );
  }
}