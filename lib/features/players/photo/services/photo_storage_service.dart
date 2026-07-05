// ***************************************************************************
// TarotScore V2
//
// Fichier : photo_storage_service.dart
//
// Description : Gestion du stockage des photos des joueurs.
// **************************************************************************

import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class PhotoStorageService {
  PhotoStorageService._();

  static final PhotoStorageService instance =
      PhotoStorageService._();

  final Uuid _uuid = const Uuid();

  //--------------------------------------------------------------------------
  // Dossier des photos
  //--------------------------------------------------------------------------

  Future<Directory> getPhotosDirectory() async {
    final appDirectory =
        await getApplicationSupportDirectory();

    final photosDirectory = Directory(
      path.join(
        appDirectory.path,
        'photos',
      ),
    );

    if (!await photosDirectory.exists()) {
      await photosDirectory.create(
        recursive: true,
      );
    }

    return photosDirectory;
  }

  //--------------------------------------------------------------------------
  // Importe une photo
  //--------------------------------------------------------------------------

  Future<String> importPhoto(
    File sourceFile,
  ) async {
    final extension = path.extension(sourceFile.path);

    final fileName = '${_uuid.v4()}$extension';

    final photosDirectory =
        await getPhotosDirectory();

    final destination = File(
      path.join(
        photosDirectory.path,
        fileName,
      ),
    );

    await sourceFile.copy(destination.path);

    return fileName;
  }

  //--------------------------------------------------------------------------
  // Retourne le fichier photo
  //--------------------------------------------------------------------------

  Future<File?> getPhoto(
    String? fileName,
  ) async {
    if (fileName == null ||
        fileName.trim().isEmpty) {
      return null;
    }

    final directory =
        await getPhotosDirectory();

    final file = File(
      path.join(
        directory.path,
        fileName,
      ),
    );

    if (!await file.exists()) {
      return null;
    }

    return file;
  }

  //--------------------------------------------------------------------------
  // Retourne le chemin complet de la photo
  //--------------------------------------------------------------------------

  Future<String?> getPhotoPath(
    String? fileName,
  ) async {
    final file = await getPhoto(fileName);

    if (file == null) {
      return null;
    }

    return file.path;
  }

  //--------------------------------------------------------------------------
  // Suppression
  //--------------------------------------------------------------------------

  Future<void> deletePhoto(
    String? fileName,
  ) async {
    final file = await getPhoto(fileName);

    if (file == null) {
      return;
    }

    await file.delete();
  }
}