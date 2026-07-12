// ***************************************************************************
//
// TarotScore V2
//
// Fichier : penalty_configuration.dart
//
// Description : Configuration d'une pénalité dans un profil de règles.
//
// Auteur : David
//
// ***************************************************************************

class PenaltyConfiguration {
  //---------------------------------------------------------------------------
  // Identification
  //---------------------------------------------------------------------------

  /// Identifiant de la pénalité (référence du catalogue).
  final String id;

  //---------------------------------------------------------------------------
  // Configuration
  //---------------------------------------------------------------------------

  /// Pénalité active.
  final bool enabled;

  /// Valeur appliquée.
  final int value;

  //---------------------------------------------------------------------------
  // Constructeur
  //---------------------------------------------------------------------------

  const PenaltyConfiguration({
    required this.id,
    this.enabled = true,
    required this.value,
  });

  //---------------------------------------------------------------------------
  // Copy
  //---------------------------------------------------------------------------

  PenaltyConfiguration copyWith({
    String? id,
    bool? enabled,
    int? value,
  }) {
    return PenaltyConfiguration(
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
        other is PenaltyConfiguration &&
            other.id == id &&
            other.enabled == enabled &&
            other.value == value;
  }

  @override
  int get hashCode => Object.hash(
        id,
        enabled,
        value,
      );
}