// ***************************************************************************
//
// TarotScore V2
//
// Fichier : bonus_configuration.dart
//
// Description : Configuration d'un bonus dans un profil de règles.
//
// Auteur : David
//
// ***************************************************************************

class BonusConfiguration {
  //---------------------------------------------------------------------------
  // Identification
  //---------------------------------------------------------------------------

  final String id;

  //---------------------------------------------------------------------------
  // Configuration
  //---------------------------------------------------------------------------

  final bool enabled;

  final int value;

  //---------------------------------------------------------------------------
  // Constructeur
  //---------------------------------------------------------------------------

  const BonusConfiguration({
    required this.id,
    this.enabled = true,
    required this.value,
  });

  //---------------------------------------------------------------------------
  // Copy
  //---------------------------------------------------------------------------

  BonusConfiguration copyWith({
    String? id,
    bool? enabled,
    int? value,
  }) {
    return BonusConfiguration(
      id: id ?? this.id,
      enabled: enabled ?? this.enabled,
      value: value ?? this.value,
    );
  }

  //---------------------------------------------------------------------------
  // Divers
  //---------------------------------------------------------------------------

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is BonusConfiguration &&
            other.id == id &&
            other.enabled == enabled &&
            other.value == value;
  }

  @override
  int get hashCode =>
      Object.hash(
        id,
        enabled,
        value,
      );
}