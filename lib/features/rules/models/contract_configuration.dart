// ***************************************************************************
//
// TarotScore V2
//
// Fichier : contract_configuration.dart
//
// Description : Configuration d'un contrat dans un profil de règles.
//
// Auteur : David
//
// ***************************************************************************

class ContractConfiguration {
  //---------------------------------------------------------------------------
  // Identification
  //---------------------------------------------------------------------------

  /// Identifiant du contrat (référence du catalogue).
  final String id;

  //---------------------------------------------------------------------------
  // Configuration
  //---------------------------------------------------------------------------

  /// Contrat disponible dans ce profil.
  final bool enabled;

  /// Multiplicateur appliqué.
  final int multiplier;

  //---------------------------------------------------------------------------
  // Constructeur
  //---------------------------------------------------------------------------

  const ContractConfiguration({
    required this.id,
    this.enabled = true,
    required this.multiplier,
  });

  //---------------------------------------------------------------------------
  // Copy
  //---------------------------------------------------------------------------

  ContractConfiguration copyWith({
    String? id,
    bool? enabled,
    int? multiplier,
  }) {
    return ContractConfiguration(
      id: id ?? this.id,
      enabled: enabled ?? this.enabled,
      multiplier: multiplier ?? this.multiplier,
    );
  }

  //---------------------------------------------------------------------------
  // Divers
  //---------------------------------------------------------------------------

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is ContractConfiguration &&
            other.id == id &&
            other.enabled == enabled &&
            other.multiplier == multiplier;
  }

  @override
  int get hashCode =>
      Object.hash(
        id,
        enabled,
        multiplier,
      );
}