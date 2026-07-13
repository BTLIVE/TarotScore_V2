// ***************************************************************************
//
// TarotScore V2
//
// Fichier : bluestick_reason.dart
//
// Description : Raisons d'attribution des BlueSticks.
//
// Auteur : David
//
// ***************************************************************************

/// Raison ayant conduit à l'attribution
/// d'une ou plusieurs BlueSticks.
enum BlueStickReason {
  //---------------------------------------------------------------------------
  // Jeu
  //---------------------------------------------------------------------------

  /// Score négatif (multiple de 500).
  score,

  /// Roi au chien.
  kingInDog,

  /// Bout au chien.
  oudlerInDog,

  /// Chien plein.
  fullDog,

  /// Mauvaise donne.
  misdeal,

  //---------------------------------------------------------------------------
  // Divers
  //---------------------------------------------------------------------------

  /// Attribution manuelle.
  manual,
}