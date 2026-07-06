// ***************************************************************************
// TarotScore V2
//
// Fichier : contract_rule.dart
//
// Description : Définit un contrat de Tarot dans un profil de règles.
//
// Auteur : David
// ***************************************************************************

class ContractRule {
  //---------------------------------------------------------------------------
  // Identification
  //---------------------------------------------------------------------------

  /// Identifiant unique du contrat dans le profil.
  ///
  /// Exemples :
  /// - petite
  /// - garde
  /// - garde_sans
  /// - garde_contre
  final String id;

  /// Nom affiché à l'utilisateur.
  final String name;

  //---------------------------------------------------------------------------
  // Règle de calcul
  //---------------------------------------------------------------------------

  /// Multiplicateur appliqué au score de base.
  final int multiplier;

  //---------------------------------------------------------------------------
  // Configuration
  //---------------------------------------------------------------------------

  /// Ordre logique du contrat.
  final int order;

  /// Indique si ce contrat est disponible dans le profil.
  final bool enabled;

  //---------------------------------------------------------------------------
  // Constructeur
  //---------------------------------------------------------------------------

  const ContractRule({
    required this.id,
    required this.name,
    required this.multiplier,
    required this.order,
    this.enabled = true,
  });

  //---------------------------------------------------------------------------
  // Copy
  //---------------------------------------------------------------------------

  ContractRule copyWith({
    String? id,
    String? name,
    int? multiplier,
    int? order,
    bool? enabled,
  }) {
    return ContractRule(
      id: id ?? this.id,
      name: name ?? this.name,
      multiplier: multiplier ?? this.multiplier,
      order: order ?? this.order,
      enabled: enabled ?? this.enabled,
    );
  }

  //---------------------------------------------------------------------------
  // Mapping
  //---------------------------------------------------------------------------

  factory ContractRule.fromMap(
    Map<String, dynamic> map,
  ) {
    return ContractRule(
      id: map['id'] as String,
      name: map['name'] as String,
      multiplier: map['multiplier'] as int,
      order: map['order'] as int,
      enabled: (map['enabled'] as int?) != 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'multiplier': multiplier,
      'order': order,
      'enabled': enabled ? 1 : 0,
    };
  }

  //---------------------------------------------------------------------------
  // Divers
  //---------------------------------------------------------------------------

  @override
  String toString() {
    return 'ContractRule('
        'id: $id, '
        'name: $name, '
        'multiplier: ×$multiplier, '
        'order: $order, '
        'enabled: $enabled'
        ')';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ContractRule &&
        other.id == id &&
        other.name == name &&
        other.multiplier == multiplier &&
        other.order == order &&
        other.enabled == enabled;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      name,
      multiplier,
      order,
      enabled,
    );
  }
}