// ***************************************************************************
//
// TarotScore V2
//
// Fichier : bluestick_transaction.dart
//
// Description : Mouvement financier lié aux BlueSticks.
//
// Auteur : David
//
// ***************************************************************************

import 'bluestick_transaction_type.dart';

class BlueStickTransaction {
  //---------------------------------------------------------------------------
  // Identification
  //---------------------------------------------------------------------------

  /// Identifiant unique.
  final String id;

  /// Date de l'opération.
  final DateTime date;

  //---------------------------------------------------------------------------
  // Opération
  //---------------------------------------------------------------------------

  /// Joueur concerné.
  ///
  /// Null pour une dépense commune.
  final String? playerId;

  /// Type d'opération.
  final BlueStickTransactionType type;

  /// Montant.
  ///
  /// Toujours positif.
  final double amount;

  /// Commentaire.
  final String description;

  //---------------------------------------------------------------------------
  // Constructeur
  //---------------------------------------------------------------------------

  const BlueStickTransaction({
    required this.id,
    required this.date,
    required this.type,
    required this.amount,
    required this.description,
    this.playerId,
  });

  //---------------------------------------------------------------------------
  // Copy
  //---------------------------------------------------------------------------

  BlueStickTransaction copyWith({
    String? id,
    DateTime? date,
    String? playerId,
    BlueStickTransactionType? type,
    double? amount,
    String? description,
  }) {
    return BlueStickTransaction(
      id: id ?? this.id,
      date: date ?? this.date,
      playerId: playerId ?? this.playerId,
      type: type ?? this.type,
      amount: amount ?? this.amount,
      description: description ?? this.description,
    );
  }

  //---------------------------------------------------------------------------
  // Divers
  //---------------------------------------------------------------------------

  @override
  String toString() {
    return 'BlueStickTransaction('
        'type: $type, '
        'amount: $amount'
        ')';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is BlueStickTransaction &&
            other.id == id &&
            other.date == date &&
            other.playerId == playerId &&
            other.type == type &&
            other.amount == amount &&
            other.description == description;
  }

  @override
  int get hashCode => Object.hash(
        id,
        date,
        playerId,
        type,
        amount,
        description,
      );
}