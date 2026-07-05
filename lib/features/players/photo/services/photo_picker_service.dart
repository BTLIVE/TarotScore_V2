// ***************************************************************************
// TarotScore V2
//
// Fichier : photo_picker_service.dart
//
// Description : Sélection d'une photo sur la plateforme.
// Ce service ne fait qu'obtenir un fichier.
// Il ne le copie pas et ne le stocke pas.
//
// Auteur : David
// ***************************************************************************

import 'dart:io';

import 'package:file_picker/file_picker.dart';

class PhotoPickerService {
  PhotoPickerService._();

  static final PhotoPickerService instance = PhotoPickerService._();

  // Sélectionne une image.
  //
  // Retourne null si l'utilisateur annule.
  Future<File?> pickPhoto() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (result == null) {
      return null;
    }

    final path = result.files.single.path;

    if (path == null) {
      return null;
    }

    return File(path);
  }
}
