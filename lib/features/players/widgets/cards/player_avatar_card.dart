import 'package:flutter/material.dart';

import '../../../../core/widgets/section_card.dart';
import '../../avatar/widgets/avatar_view.dart';

class PlayerAvatarCard extends StatelessWidget {
  const PlayerAvatarCard({
    super.key,
    required this.avatarId,
    this.photoPath,
    required this.onAvatarPressed,
    required this.onPhotoPressed,
  });

  final String avatarId;
  final String? photoPath;

  final VoidCallback onAvatarPressed;
  final VoidCallback onPhotoPressed;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'Avatar',
      icon: Icons.account_circle,
      child: Column(
        children: [
          AvatarView(
            avatarId: avatarId,
            photoPath: photoPath,
            radius: 60,
          ),

          const SizedBox(height: 24),

          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              icon: const Icon(Icons.face),
              label: const Text('Modifier l\'avatar'),
              onPressed: onAvatarPressed,
            ),
          ),

          const SizedBox(height: 12),

          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              icon: const Icon(Icons.photo_camera),
              label: const Text('Importer une photo'),
              onPressed: onPhotoPressed,
            ),
          ),
        ],
      ),
    );
  }
}