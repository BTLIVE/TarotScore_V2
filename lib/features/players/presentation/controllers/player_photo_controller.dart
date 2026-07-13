// ***************************************************************************
//
// TarotScore V2
//
// Fichier : player_photo_controller.dart
//
// Description : Contrôleur de gestion de la photo d'un joueur.
//
// Auteur : David
//
// ***************************************************************************

import 'package:flutter/foundation.dart';

import '../../../media/models/media_image.dart';
import '../../../media/services/image_capture_service.dart';
import '../../../media/services/image_storage_service.dart';

class PlayerPhotoController extends ChangeNotifier {
  //---------------------------------------------------------------------------
  // Dépendances
  //---------------------------------------------------------------------------

  final ImageCaptureService _captureService;
  final ImageStorageService _storageService;

  //---------------------------------------------------------------------------
  // Etat
  //---------------------------------------------------------------------------

  MediaImage? _image;

  //---------------------------------------------------------------------------
  // Constructeur
  //---------------------------------------------------------------------------

  PlayerPhotoController({
    required ImageCaptureService captureService,
    required ImageStorageService storageService,
    MediaImage? image,
  })  : _captureService = captureService,
        _storageService = storageService,
        _image = image;

  //---------------------------------------------------------------------------
  // Getters
  //---------------------------------------------------------------------------

  MediaImage? get image => _image;

  bool get hasImage => _image != null;

  //---------------------------------------------------------------------------
  // Caméra
  //---------------------------------------------------------------------------

  Future<void> takePhoto() async {
    final image = await _captureService.captureFromCamera();

    if (image == null) {
      return;
    }

    _image = image;
    notifyListeners();
  }

  //---------------------------------------------------------------------------
  // Galerie
  //---------------------------------------------------------------------------

  Future<void> pickPhoto() async {
    final image = await _captureService.pickFromGallery();

    if (image == null) {
      return;
    }

    _image = image;
    notifyListeners();
  }

  //---------------------------------------------------------------------------
  // Suppression
  //---------------------------------------------------------------------------

  Future<void> deletePhoto() async {
    _image = null;
    notifyListeners();
  }

  //---------------------------------------------------------------------------
  // Sauvegarde
  //---------------------------------------------------------------------------

  Future<String?> save(
    String playerUuid,
  ) async {
    if (_image == null) {
      return null;
    }

    return _storageService.savePlayerImage(
      _image!,
      playerUuid,
    );
  }
}