// ***************************************************************************
// TarotScore V2
//
// Fichier : base_score.dart
//
// Description : Résultat du calcul du score de base.
//
// Auteur : David
// ***************************************************************************

class BaseScore {
  /// Contrat réussi.
  final bool success;

  /// Score de base.
  final int value;

  const BaseScore({
    required this.success,
    required this.value,
  });

  @override
  String toString() {
    return 'BaseScore('
        'success: $success, '
        'value: $value'
        ')';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is BaseScore &&
            other.success == success &&
            other.value == value;
  }

  @override
  int get hashCode {
    return Object.hash(
      success,
      value,
    );
  }
}