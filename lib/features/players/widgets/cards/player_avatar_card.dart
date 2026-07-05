import 'package:flutter/material.dart';

import '../../../../core/widgets/section_card.dart';

class PlayerAvatarCard extends StatelessWidget {
  const PlayerAvatarCard({
    super.key,
    required this.onAvatarPressed,
    required this.onPhotoPressed,
  });

  final VoidCallback onAvatarPressed;
  final VoidCallback onPhotoPressed;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'Avatar et photo',
      icon: Icons.image,
      child: Column(
        children: [
          const CircleAvatar(
            radius: 48,
            child: Icon(
              Icons.person,
              size: 48,
            ),
          ),

          const SizedBox(height: 24),

          FilledButton.icon(
            onPressed: onAvatarPressed,
            icon: const Icon(Icons.face),
            label: const Text('Choisir un avatar'),
          ),

          const SizedBox(height: 12),

          OutlinedButton.icon(
            onPressed: onPhotoPressed,
            icon: const Icon(Icons.photo_camera),
            label: const Text('Choisir une photo'),
          ),
        ],
      ),
    );
  }
}