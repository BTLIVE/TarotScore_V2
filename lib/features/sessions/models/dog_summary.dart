// ***************************************************************************
//
// TarotScore V2
//
// Fichier : dog_summary.dart
//
// Description : Résumé des informations du chien utiles à l'application.
//
// Auteur : David
//
// ***************************************************************************

class DogSummary {
  //---------------------------------------------------------------------------
  // Informations utiles
  //---------------------------------------------------------------------------

  /// Nombre de bouts présents au chien.
  final int oudlers;

  /// Nombre de rois présents au chien.
  final int kings;

  /// Le chien est considéré comme plein.
  final bool isFull;

  //---------------------------------------------------------------------------
  // Constructeur
  //---------------------------------------------------------------------------

  const DogSummary({
    this.oudlers = 0,
    this.kings = 0,
    this.isFull = false,
  });

  //---------------------------------------------------------------------------
  // Getters
  //---------------------------------------------------------------------------

  /// Le chien contient des informations utiles.
  bool get hasData =>
      oudlers > 0 ||
      kings > 0 ||
      isFull;

  //---------------------------------------------------------------------------
  // Copy
  //---------------------------------------------------------------------------

  DogSummary copyWith({
    int? oudlers,
    int? kings,
    bool? isFull,
  }) {
    return DogSummary(
      oudlers: oudlers ?? this.oudlers,
      kings: kings ?? this.kings,
      isFull: isFull ?? this.isFull,
    );
  }

  //---------------------------------------------------------------------------
  // Divers
  //---------------------------------------------------------------------------

  @override
  String toString() {
    return 'DogSummary('
        'oudlers: $oudlers, '
        'kings: $kings, '
        'isFull: $isFull'
        ')';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is DogSummary &&
            other.oudlers == oudlers &&
            other.kings == kings &&
            other.isFull == isFull;
  }

  @override
  int get hashCode =>
      Object.hash(
        oudlers,
        kings,
        isFull,
      );
}