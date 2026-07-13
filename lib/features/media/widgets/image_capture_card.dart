// ***************************************************************************
//
// TarotScore V2
//
// Fichier : image_capture_card.dart
//
// Description : Widget de capture et d'affichage d'une image.
//
// Auteur : David
//
// ***************************************************************************

import 'dart:io';

import 'package:flutter/material.dart';

import '../../../core/theme/app_spacing.dart';
import '../../../core/widgets/app_card.dart';

import '../models/media_image.dart';

class ImageCaptureCard extends StatelessWidget {
  //---------------------------------------------------------------------------
  // Paramètres
  //---------------------------------------------------------------------------

  final String title;

  final MediaImage? image;

  final VoidCallback? onCamera;

  final VoidCallback? onGallery;

  final VoidCallback? onDelete;

  //---------------------------------------------------------------------------
  // Constructeur
  //---------------------------------------------------------------------------

  const ImageCaptureCard({
    super.key,
    required this.title,
    this.image,
    this.onCamera,
    this.onGallery,
    this.onDelete,
  });

  //---------------------------------------------------------------------------
  // UI
  //---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Padding(
        padding: const EdgeInsets.all(
          AppSpacing.lg,
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.stretch,
          children: [
            //----------------------------------------------------------------
            // Titre
            //----------------------------------------------------------------

            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium,
            ),

            const SizedBox(
              height: AppSpacing.lg,
            ),

            //----------------------------------------------------------------
            // Aperçu
            //----------------------------------------------------------------

            AspectRatio(
              aspectRatio: 4 / 3,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade400,
                  ),
                  borderRadius:
                      BorderRadius.circular(8),
                ),
                clipBehavior: Clip.antiAlias,
                child: image == null
                    ? const Center(
                        child: Icon(
                          Icons.photo_camera_outlined,
                          size: 48,
                        ),
                      )
                    : Image.file(
                        File(image!.path),
                        fit: BoxFit.cover,
                      ),
              ),
            ),

            const SizedBox(
              height: AppSpacing.lg,
            ),

            //----------------------------------------------------------------
            // Actions
            //----------------------------------------------------------------

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  tooltip: 'Caméra',
                  onPressed: onCamera,
                  icon: const Icon(
                    Icons.photo_camera,
                  ),
                ),
                IconButton(
                  tooltip: 'Galerie',
                  onPressed: onGallery,
                  icon: const Icon(
                    Icons.photo_library,
                  ),
                ),
                IconButton(
                  tooltip: 'Supprimer',
                  onPressed: image == null
                      ? null
                      : onDelete,
                  icon: const Icon(
                    Icons.delete_outline,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}