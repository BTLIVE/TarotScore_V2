// ***************************************************************************
//
// TarotScore V2
//
// Fichier : bluestick_bank.dart
//
// Description : Banque des BlueSticks.
//
// Auteur : David
//
// ***************************************************************************

class BlueStickBank {
  //---------------------------------------------------------------------------
  // Identification
  //---------------------------------------------------------------------------

  /// Nom de la banque.
  ///
  /// Par défaut : "Le Père Noël".
  final String name;

  //---------------------------------------------------------------------------
  // Configuration
  //---------------------------------------------------------------------------

  /// Valeur d'une BlueStick.
  final double blueStickValue;

  //---------------------------------------------------------------------------
  // Etat
  //---------------------------------------------------------------------------

  /// Montant disponible.
  final double balance;

  //---------------------------------------------------------------------------
  // Constructeur
  //---------------------------------------------------------------------------

  const BlueStickBank({
    this.name = 'Le Père Noël',
    this.blueStickValue = 0.50,
    this.balance = 0.0,
  });

  //---------------------------------------------------------------------------
  // Copy
  //---------------------------------------------------------------------------

  BlueStickBank copyWith({
    String? name,
    double? blueStickValue,
    double? balance,
  }) {
    return BlueStickBank(
      name: name ?? this.name,
      blueStickValue:
          blueStickValue ?? this.blueStickValue,
      balance: balance ?? this.balance,
    );
  }

  //---------------------------------------------------------------------------
  // Divers
  //---------------------------------------------------------------------------

  @override
  String toString() {
    return 'BlueStickBank('
        'name: $name, '
        'blueStickValue: $blueStickValue, '
        'balance: $balance'
        ')';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is BlueStickBank &&
            other.name == name &&
            other.blueStickValue ==
                blueStickValue &&
            other.balance == balance;
  }

  @override
  int get hashCode =>
      Object.hash(
        name,
        blueStickValue,
        balance,
      );
}