// ***************************************************************************
//
// TarotScore V2
//
// Fichier : difference_calculation_mode.dart
//
// Description : Mode de calcul de l'écart.
//
// Auteur : David
//
// ***************************************************************************

/// Définit la méthode utilisée pour calculer
/// l'écart pris en compte dans le score.
enum DifferenceCalculationMode {
  /// Utilise l'écart réel.
  exact,

  /// Arrondit l'écart à la dizaine la plus proche.
  roundedToTen,
}