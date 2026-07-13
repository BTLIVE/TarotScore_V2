// ***************************************************************************
//
// TarotScore V2
//
// Fichier : media_image.dart
//
// Description : Représente une image temporaire provenant de la caméra
// ou de la galerie.
//
// Auteur : David
//
// ***************************************************************************

class MediaImage {
  //---------------------------------------------------------------------------
  // Chemin temporaire
  //---------------------------------------------------------------------------

  /// Chemin du fichier image temporaire.
  final String path;

  //---------------------------------------------------------------------------
  // Constructeur
  //---------------------------------------------------------------------------

  const MediaImage({
    required this.path,
  });

  //---------------------------------------------------------------------------
  // Copy
  //---------------------------------------------------------------------------

  MediaImage copyWith({
    String? path,
  }) {
    return MediaImage(
      path: path ?? this.path,
    );
  }

  //---------------------------------------------------------------------------
  // Divers
  //---------------------------------------------------------------------------

  @override
  String toString() {
    return 'MediaImage(path: $path)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is MediaImage &&
            other.path == path;
  }

  @override
  int get hashCode => path.hashCode;
}