import 'dart:io';

import 'package:flutter/material.dart';

import '../services/avatar_service.dart';

class AvatarView extends StatelessWidget {
  const AvatarView({
    super.key,
    required this.avatarId,
    this.photoPath,
    this.radius = 40,
  });

  final String avatarId;
  final String? photoPath;
  final double radius;

  @override
  Widget build(BuildContext context) {
    // Photo du joueur
    if (photoPath != null &&
        photoPath!.isNotEmpty &&
        File(photoPath!).existsSync()) {
      return CircleAvatar(
        radius: radius,
        backgroundImage: FileImage(
          File(photoPath!),
        ),
      );
    }

    // Avatar
    return CircleAvatar(
      radius: radius,
      backgroundImage: AssetImage(
        AvatarService.instance.asset(avatarId),
      ),
    );
  }
}