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

  /// Ancien multiplicateur.
  ///
  /// Conservé temporairement afin d'assurer la compatibilité pendant
  /// la migration vers le nouveau moteur de calcul.
  final int multiplier;

  /// Multiplicateur appliqué aux points de base.
  final int baseMultiplier;

  /// Multiplicateur appliqué à l'écart.
  final int differenceMultiplier;

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
    int? baseMultiplier,
    int? differenceMultiplier,
    required this.order,
    this.enabled = true,
  })  : baseMultiplier =
            baseMultiplier ?? multiplier,
        differenceMultiplier =
            differenceMultiplier ?? multiplier;

  //---------------------------------------------------------------------------
  // Copy
  //---------------------------------------------------------------------------

  ContractRule copyWith({
    String? id,
    String? name,
    int? multiplier,
    int? baseMultiplier,
    int? differenceMultiplier,
    int? order,
    bool? enabled,
  }) {
    return ContractRule(
      id: id ?? this.id,
      name: name ?? this.name,

      multiplier:
          multiplier ?? this.multiplier,

      baseMultiplier:
          baseMultiplier ??
              this.baseMultiplier,

      differenceMultiplier:
          differenceMultiplier ??
              this.differenceMultiplier,

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
    final multiplier =
        map['multiplier'] as int;

    return ContractRule(
      id: map['id'] as String,
      name: map['name'] as String,

      multiplier: multiplier,

      baseMultiplier:
          map['baseMultiplier'] as int? ??
              multiplier,

      differenceMultiplier:
          map['differenceMultiplier'] as int? ??
              multiplier,

      order: map['order'] as int,

      enabled:
          (map['enabled'] as int?) != 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,

      // Ancien format conservé
      // pendant la migration.
      'multiplier': multiplier,

      // Nouveau format.
      'baseMultiplier':
          baseMultiplier,
      'differenceMultiplier':
          differenceMultiplier,

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
        'baseMultiplier: ×$baseMultiplier, '
        'differenceMultiplier: ×$differenceMultiplier, '
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
        other.multiplier ==
            multiplier &&
        other.baseMultiplier ==
            baseMultiplier &&
        other.differenceMultiplier ==
            differenceMultiplier &&
        other.order == order &&
        other.enabled == enabled;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      name,
      multiplier,
      baseMultiplier,
      differenceMultiplier,
      order,
      enabled,
    );
  }
}