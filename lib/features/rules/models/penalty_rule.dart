// ***************************************************************************
//
// TarotScore V2
//
// Fichier : penalty_rule.dart
//
// Description : Configuration d'une pénalité dans un profil de règles.
//
// Auteur : David
//
// ***************************************************************************

class PenaltyRule {
  //---------------------------------------------------------------------------
  // Identification
  //---------------------------------------------------------------------------

  /// Identifiant unique.
  final String id;

  /// Nom de la pénalité.
  final String name;

  /// Description.
  final String description;

  /// Ordre d'affichage.
  final int order;

  //---------------------------------------------------------------------------
  // Configuration
  //---------------------------------------------------------------------------

  /// Pénalité disponible dans ce profil.
  final bool enabled;

  /// Valeur appliquée.
  final int value;

  //---------------------------------------------------------------------------
  // Constructeur
  //---------------------------------------------------------------------------

  const PenaltyRule({
    required this.id,
    required this.name,
    required this.description,
    required this.order,
    this.enabled = true,
    required this.value,
  });

  //---------------------------------------------------------------------------
  // Copy
  //---------------------------------------------------------------------------

  PenaltyRule copyWith({
    String? id,
    String? name,
    String? description,
    int? order,
    bool? enabled,
    int? value,
  }) {
    return PenaltyRule(
      id: id ?? this.id,
      name: name ?? this.name,
      description:
          description ?? this.description,
      order: order ?? this.order,
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
        other is PenaltyRule &&
            other.id == id &&
            other.name == name &&
            other.description == description &&
            other.order == order &&
            other.enabled == enabled &&
            other.value == value;
  }

  @override
  int get hashCode => Object.hash(
        id,
        name,
        description,
        order,
        enabled,
        value,
      );
}