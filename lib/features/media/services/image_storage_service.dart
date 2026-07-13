// ***************************************************************************
//
// TarotScore V2
//
// Fichier : image_storage_service.dart
//
// Description : Gestion du stockage des images.
//
// Auteur : David
//
// ***************************************************************************

import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import '../models/media_image.dart';

class ImageStorageService {
  const ImageStorageService();

  //--------------------------------------------------------------------------
  // Joueurs
  //--------------------------------------------------------------------------

  Future<String> savePlayerImage(
    MediaImage image,
    String playerUuid,
  ) {
    return _saveImage(
      image: image,
      directoryParts: const [
        'images',
        'players',
      ],
      fileName: playerUuid,
    );
  }

  //--------------------------------------------------------------------------
  // Chiens
  //--------------------------------------------------------------------------

  Future<String> saveDogImage(
    MediaImage image,
    String sessionUuid,
    String dealUuid,
  ) {
    return _saveImage(
      image: image,
      directoryParts: [
        'images',
        'dogs',
        sessionUuid,
      ],
      fileName: dealUuid,
    );
  }

  //--------------------------------------------------------------------------
  // Sauvegarde générique
  //--------------------------------------------------------------------------

  Future<String> _saveImage({
    required MediaImage image,
    required List<String> directoryParts,
    required String fileName,
  }) async {
    final root =
        await getApplicationDocumentsDirectory();

    final directory = Directory(
      path.joinAll([
        root.path,
        ...directoryParts,
      ]),
    );

    await directory.create(
      recursive: true,
    );

    final extension =
        path.extension(image.path);

    final relativePath = path.joinAll([
      ...directoryParts,
      '$fileName$extension',
    ]);

    final destination = path.join(
      root.path,
      relativePath,
    );

    final destinationFile =
        File(destination);

    // Remplace automatiquement une image existante.
    if (await destinationFile.exists()) {
      await destinationFile.delete();
    }

    await File(image.path).copy(
      destination,
    );

    return relativePath;
  }

  //--------------------------------------------------------------------------
  // Lecture
  //--------------------------------------------------------------------------

  Future<String?> getImagePath(
    String? relativePath,
  ) async {
    if (relativePath == null ||
        relativePath.trim().isEmpty) {
      return null;
    }

    final root =
        await getApplicationDocumentsDirectory();

    final absolutePath = path.join(
      root.path,
      relativePath,
    );

    final file = File(absolutePath);

    if (!await file.exists()) {
      return null;
    }

    return absolutePath;
  }

  //--------------------------------------------------------------------------
  // Suppression
  //--------------------------------------------------------------------------

  Future<void> deleteStoredImage(
    String? relativePath,
  ) async {
    if (relativePath == null ||
        relativePath.trim().isEmpty) {
      return;
    }

    final root =
        await getApplicationDocumentsDirectory();

    final absolutePath = path.join(
      root.path,
      relativePath,
    );

    final file = File(absolutePath);

    if (await file.exists()) {
      await file.delete();
    }
  }
}