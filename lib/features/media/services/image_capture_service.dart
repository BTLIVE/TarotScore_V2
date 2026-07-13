// ***************************************************************************
//
// TarotScore V2
//
// Fichier : image_capture_service.dart
//
// Description : Acquisition d'images depuis la caméra ou la galerie.
//
// Auteur : David
//
// ***************************************************************************

import '../models/media_image.dart';

abstract class ImageCaptureService {
  //---------------------------------------------------------------------------
  // Caméra
  //---------------------------------------------------------------------------

  /// Prend une photo avec l'appareil photo.
  ///
  /// Retourne null si l'utilisateur annule.
  Future<MediaImage?> captureFromCamera();

  //---------------------------------------------------------------------------
  // Galerie
  //---------------------------------------------------------------------------

  /// Sélectionne une image depuis la galerie.
  ///
  /// Retourne null si l'utilisateur annule.
  Future<MediaImage?> pickFromGallery();
}