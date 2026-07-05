import 'package:flutter/material.dart';

import '../../../../core/widgets/section_card.dart';

class PlayerInformationCard extends StatelessWidget {
  const PlayerInformationCard({
    super.key,
    required this.birthDate,
    required this.commentsController,
    required this.onBirthDatePressed,
  });

  final DateTime? birthDate;
  final TextEditingController commentsController;
  final VoidCallback onBirthDatePressed;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'Informations personnelles',
      icon: Icons.badge,
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Date de naissance'),
            subtitle: Text(
              birthDate == null
                  ? 'Non renseignée'
                  : '${birthDate!.day.toString().padLeft(2, '0')}/'
                    '${birthDate!.month.toString().padLeft(2, '0')}/'
                    '${birthDate!.year}',
            ),
            trailing: const Icon(Icons.calendar_month),
            onTap: onBirthDatePressed,
          ),

          const SizedBox(height: 16),

          TextFormField(
            controller: commentsController,
            maxLines: 5,
            textInputAction: TextInputAction.newline,
            decoration: const InputDecoration(
              labelText: 'Commentaires',
              alignLabelWithHint: true,
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}