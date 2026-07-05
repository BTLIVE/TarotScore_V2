import 'package:flutter/material.dart';

import '../services/avatar_service.dart';

class AvatarTile extends StatelessWidget {
  const AvatarTile({
    super.key,
    required this.avatarId,
    required this.selected,
    required this.onTap,
  });

  final String avatarId;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(40),
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: selected
                ? theme.colorScheme.primary.withOpacity(0.10)
                : null,
            border: Border.all(
              color: selected
                  ? theme.colorScheme.primary
                  : Colors.grey.shade300,
              width: selected ? 3 : 1,
            ),
            boxShadow: selected
                ? [
                    BoxShadow(
                      color: theme.colorScheme.primary.withOpacity(0.25),
                      blurRadius: 8,
                      spreadRadius: 1,
                    ),
                  ]
                : null,
          ),
          child: ClipOval(
            child: Image.asset(
              AvatarService.instance.asset(avatarId),
              width: 64,
              height: 64,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
          ),
        ),
      ),
    );
  }
}