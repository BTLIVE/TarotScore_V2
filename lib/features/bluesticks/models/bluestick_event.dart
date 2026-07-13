// ***************************************************************************
//
// TarotScore V2
//
// Fichier : bluestick_event.dart
//
// Description : Evénement d'attribution de BlueSticks.
//
// Auteur : David
//
// ***************************************************************************

import 'bluestick_reason.dart';

class BlueStickEvent {
  //---------------------------------------------------------------------------
  // Identification
  //---------------------------------------------------------------------------

  /// Identifiant unique.
  final String id;

  /// Session concernée.
  final String sessionId;

  /// Donne concernée.
  ///
  /// Null si l'événement n'est pas lié à une donne.
  final String? dealId;

  /// Joueur concerné.
  final String playerId;

  //---------------------------------------------------------------------------
  // Attribution
  //---------------------------------------------------------------------------

  /// Raison de l'attribution.
  final BlueStickReason reason;

  /// Nombre de BlueSticks attribuées.
  final int quantity;

  /// Commentaire libre.
  ///
  /// Utilisé principalement pour les attributions manuelles.
  final String? comment;

  //---------------------------------------------------------------------------
  // Constructeur
  //---------------------------------------------------------------------------

  const BlueStickEvent({
    required this.id,
    required this.sessionId,
    required this.playerId,
    required this.reason,
    required this.quantity,
    this.dealId,
    this.comment,
  });

  //---------------------------------------------------------------------------
  // Copy
  //---------------------------------------------------------------------------

  BlueStickEvent copyWith({
    String? id,
    String? sessionId,
    String? dealId,
    String? playerId,
    BlueStickReason? reason,
    int? quantity,
    String? comment,
  }) {
    return BlueStickEvent(
      id: id ?? this.id,
      sessionId: sessionId ?? this.sessionId,
      dealId: dealId ?? this.dealId,
      playerId: playerId ?? this.playerId,
      reason: reason ?? this.reason,
      quantity: quantity ?? this.quantity,
      comment: comment ?? this.comment,
    );
  }

  //---------------------------------------------------------------------------
  // Divers
  //---------------------------------------------------------------------------

  @override
  String toString() {
    return 'BlueStickEvent('
        'playerId: $playerId, '
        'reason: $reason, '
        'quantity: $quantity'
        ')';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is BlueStickEvent &&
            other.id == id &&
            other.sessionId == sessionId &&
            other.dealId == dealId &&
            other.playerId == playerId &&
            other.reason == reason &&
            other.quantity == quantity &&
            other.comment == comment;
  }

  @override
  int get hashCode => Object.hash(
        id,
        sessionId,
        dealId,
        playerId,
        reason,
        quantity,
        comment,
      );
}