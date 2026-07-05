import 'package:flutter/material.dart';

import '../../../../core/widgets/section_card.dart';

class PlayerContactCard extends StatelessWidget {
  const PlayerContactCard({
    super.key,
    required this.emailController,
    required this.mobilePhoneController,
    this.emailValidator,
    this.mobilePhoneValidator,
  });

  final TextEditingController emailController;
  final TextEditingController mobilePhoneController;

  final FormFieldValidator<String>? emailValidator;
  final FormFieldValidator<String>? mobilePhoneValidator;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'Contact',
      icon: Icons.contact_phone,
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
            validator: emailValidator,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: 'E-mail',
              hintText: 'nom@domaine.fr',
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 16),

          TextFormField(
            controller: mobilePhoneController,
            validator: mobilePhoneValidator,
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: 'Téléphone mobile',
              hintText: '06 12 34 56 78',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}