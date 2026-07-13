// ***************************************************************************
//
// TarotScore V2
//
// Fichier : bluestick_transaction_type.dart
//
// Description : Types de mouvements financiers.
//
// Auteur : David
//
// ***************************************************************************

enum BlueStickTransactionType {
  /// Versement d'un joueur.
  deposit,

  /// Dépense de la cagnotte.
  expense,

  /// Ajustement exceptionnel.
  adjustment,
}