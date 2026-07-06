// ***************************************************************************
// TarotScore V2
//
// Fichier : invalid_deal_exception.dart
//
// Description : Exception levée lorsqu'une manche est invalide.
//
// Auteur : David
// ***************************************************************************

class InvalidDealException implements Exception {
  final String message;

  const InvalidDealException(this.message);

  @override
  String toString() {
    return 'InvalidDealException: $message';
  }
}