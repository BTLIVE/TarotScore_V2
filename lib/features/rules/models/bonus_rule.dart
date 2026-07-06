// ***************************************************************************
// TarotScore V2
//
// Fichier : bonus_rule.dart
//
// Description : Définit un bonus (ou malus) dans un profil de règles.
//
// Auteur : David
// ***************************************************************************

class BonusRule {
  //---------------------------------------------------------------------------
  // Identification
  //---------------------------------------------------------------------------

  /// Identifiant unique.
  ///
  /// Exemples :
  /// - petit
  /// - poignee_simple
  /// - poignee_double
  /// - poignee_triple
  /// - chelem
  final String id;

  /// Nom affiché.
  final String name;

  /// Identifiant du type de bonus.
  ///
  /// Cet identifiant est interprété par le RuleEngine.
  ///
  /// Exemples :
  /// - petit
  /// - poignee
  /// - chelem
  /// - misere
  /// - personnalise
  final String typeId;

  //---------------------------------------------------------------------------
  // Valeur
  //---------------------------------------------------------------------------

  /// Valeur du bonus.
  ///
  /// Peut être positive ou négative.
  final int value;

  //---------------------------------------------------------------------------
  // Configuration
  //---------------------------------------------------------------------------

  /// Ordre logique dans le profil.
  final int order;

  /// Bonus disponible.
  final bool enabled;

  //---------------------------------------------------------------------------
  // Constructeur
  //---------------------------------------------------------------------------

  const BonusRule({
    required this.id,
    required this.name,
    required this.typeId,
    required this.value,
    required this.order,
    this.enabled = true,
  });

  //---------------------------------------------------------------------------
  // Copy
  //---------------------------------------------------------------------------

  BonusRule copyWith({
    String? id,
    String? name,
    String? typeId,
    int? value,
    int? order,
    bool? enabled,
  }) {
    return BonusRule(
      id: id ?? this.id,
      name: name ?? this.name,
      typeId: typeId ?? this.typeId,
      value: value ?? this.value,
      order: order ?? this.order,
      enabled: enabled ?? this.enabled,
    );
  }

  //---------------------------------------------------------------------------
  // Mapping
  //---------------------------------------------------------------------------

  factory BonusRule.fromMap(
    Map<String, dynamic> map,
  ) {
    return BonusRule(
      id: map['id'] as String,
      name: map['name'] as String,
      typeId: map['type_id'] as String,
      value: map['value'] as int,
      order: map['order'] as int,
      enabled: (map['enabled'] as int?) != 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type_id': typeId,
      'value': value,
      'order': order,
      'enabled': enabled ? 1 : 0,
    };
  }

  //---------------------------------------------------------------------------
  // Divers
  //---------------------------------------------------------------------------

  @override
  String toString() {
    return 'BonusRule('
        'id: $id, '
        'name: $name, '
        'typeId: $typeId, '
        'value: $value, '
        'order: $order, '
        'enabled: $enabled'
        ')';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is BonusRule &&
        other.id == id &&
        other.name == name &&
        other.typeId == typeId &&
        other.value == value &&
        other.order == order &&
        other.enabled == enabled;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      name,
      typeId,
      value,
      order,
      enabled,
    );
  }
}