// ***************************************************************************
// TarotScore V2
//
// Fichier : deal_event.dart
//
// Description : Evènement déclaré lors d'une manche.
//
// Auteur : David
// ***************************************************************************

class DealEvent {
  //---------------------------------------------------------------------------
  // Identification
  //---------------------------------------------------------------------------

  /// Identifiant de l'évènement.
  ///
  /// Exemples :
  /// - petit
  /// - poignee
  /// - chelem
  /// - misere
  final String id;

  /// Valeur éventuelle.
  ///
  /// Exemples :
  /// "simple"
  /// "double"
  /// "triple"
  /// "annonce"
  /// "true"
  final String? value;

  //---------------------------------------------------------------------------
  // Constructeur
  //---------------------------------------------------------------------------

  const DealEvent({
    required this.id,
    this.value,
  });

  //---------------------------------------------------------------------------
  // Copy
  //---------------------------------------------------------------------------

  DealEvent copyWith({
    String? id,
    String? value,
  }) {
    return DealEvent(
      id: id ?? this.id,
      value: value ?? this.value,
    );
  }

  //---------------------------------------------------------------------------
  // Mapping
  //---------------------------------------------------------------------------

  factory DealEvent.fromMap(
    Map<String, dynamic> map,
  ) {
    return DealEvent(
      id: map['id'] as String,
      value: map['value'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'value': value,
    };
  }

  //---------------------------------------------------------------------------
  // Divers
  //---------------------------------------------------------------------------

  @override
  String toString() {
    return 'DealEvent('
        'id: $id, '
        'value: $value'
        ')';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is DealEvent &&
            other.id == id &&
            other.value == value;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      value,
    );
  }
}