// ***************************************************************************
//
// TarotScore V2
//
// Fichier : applied_bonus.dart
//
// Description : Bonus réellement appliqué lors du calcul d'une donne.
//
// Auteur : David
//
// ***************************************************************************

class AppliedBonus {
  //---------------------------------------------------------------------------
  // Identification
  //---------------------------------------------------------------------------

  /// Identifiant du bonus.
  ///
  /// Exemples :
  /// - petit
  /// - poignee_double
  /// - chelem_annonce
  final String id;

  /// Type du bonus.
  ///
  /// Exemples :
  /// - petit
  /// - poignee
  /// - chelem
  final String typeId;

  //---------------------------------------------------------------------------
  // Affichage
  //---------------------------------------------------------------------------

  /// Libellé affiché à l'utilisateur.
  ///
  /// Exemples :
  /// - Petit au bout
  /// - Double poignée
  /// - Chelem annoncé
  final String name;

  /// Texte complémentaire éventuel.
  ///
  /// Exemples :
  /// - Attaque
  /// - Défense
  /// - Réussi
  /// - Chuté
  final String? description;

  //---------------------------------------------------------------------------
  // Valeur
  //---------------------------------------------------------------------------

  /// Valeur réellement appliquée.
  final int value;

  //---------------------------------------------------------------------------
  // Constructeur
  //---------------------------------------------------------------------------

  const AppliedBonus({
    required this.id,
    required this.typeId,
    required this.name,
    this.description,
    required this.value,
  });

  //---------------------------------------------------------------------------
  // Getters
  //---------------------------------------------------------------------------

  bool get hasDescription =>
      description != null &&
      description!.isNotEmpty;

  //---------------------------------------------------------------------------
  // Divers
  //---------------------------------------------------------------------------

  @override
  String toString() {
    return 'AppliedBonus('
        'id: $id, '
        'type: $typeId, '
        'value: $value'
        ')';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is AppliedBonus &&
            other.id == id &&
            other.typeId == typeId &&
            other.name == name &&
            other.description == description &&
            other.value == value;
  }

  @override
  int get hashCode =>
      Object.hash(
        id,
        typeId,
        name,
        description,
        value,
      );
}