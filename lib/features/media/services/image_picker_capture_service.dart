// ***************************************************************************
//
// TarotScore V2
//
// Fichier : image_picker_capture_service.dart
//
// Description : Implémentation Flutter du service d'acquisition d'images.
//
// Auteur : David
//
// ***************************************************************************

import 'package:image_picker/image_picker.dart';

import '../models/media_image.dart';
import 'image_capture_service.dart';

class ImagePickerCaptureService
    implements ImageCaptureService {
  //---------------------------------------------------------------------------
  // Dépendances
  //---------------------------------------------------------------------------

  final ImagePicker _picker = ImagePicker();

  //---------------------------------------------------------------------------
  // Caméra
  //---------------------------------------------------------------------------

  @override
  Future<MediaImage?> captureFromCamera() async {
    final image = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 85,
      maxWidth: 1600,
      maxHeight: 1600,
    );

    if (image == null) {
      return null;
    }

    return MediaImage(
      path: image.path,
    );
  }

  //---------------------------------------------------------------------------
  // Galerie
  //---------------------------------------------------------------------------

  @override
  Future<MediaImage?> pickFromGallery() async {
    final image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
      maxWidth: 1600,
      maxHeight: 1600,
    );

    if (image == null) {
      return null;
    }

    return MediaImage(
      path: image.path,
    );
  }
}