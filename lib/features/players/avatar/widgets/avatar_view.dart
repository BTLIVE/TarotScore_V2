// ***************************************************************************
// TarotScore V2
//
// Fichier : avatar_view.dart
//
// Description : Affichage de l'avatar ou de la photo d'un joueur.
// ***************************************************************************

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
    //----------------------------------------------------------------------
    // Photo personnelle
    //----------------------------------------------------------------------

    if (photoPath != null && photoPath!.trim().isNotEmpty) {
      final file = File(photoPath!);

      if (file.existsSync()) {
        return CircleAvatar(
          radius: radius,
          backgroundImage: FileImage(file),
        );
      }
    }

    //----------------------------------------------------------------------
    // Avatar par défaut
    //----------------------------------------------------------------------

    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.transparent,
      child: ClipOval(
        child: Image.asset(
          AvatarService.instance.asset(avatarId),
          width: radius * 2,
          height: radius * 2,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
          errorBuilder: (context, error, stackTrace) {
            return Icon(
              Icons.person,
              size: radius,
            );
          },
        ),
      ),
    );
  }
}