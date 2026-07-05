import 'package:flutter/material.dart';

import 'avatar_tile.dart';

class AvatarSection extends StatelessWidget {
  const AvatarSection({
    super.key,
    required this.title,
    required this.avatars,
    required this.selectedAvatar,
    required this.onSelected,
  });

  final String title;
  final List<String> avatars;
  final String selectedAvatar;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),

        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: avatars.length,
          gridDelegate:
              const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 90,
            childAspectRatio: 1,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            final avatar = avatars[index];

            return AvatarTile(
              avatarId: avatar,
              selected: avatar == selectedAvatar,
              onTap: () => onSelected(avatar),
            );
          },
        ),

        const SizedBox(height: 24),
      ],
    );
  }
}