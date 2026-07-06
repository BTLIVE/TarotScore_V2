// ***************************************************************************
// TarotScore V2
//
// Fichier : deal.dart
//
// Description : Représente une manche de Tarot.
//
// Une manche ne contient que les faits observés.
// Aucun score n'est enregistré.
//
// Auteur : David
// ***************************************************************************

import 'deal_event.dart';

class Deal {
  //---------------------------------------------------------------------------
  // Identification
  //---------------------------------------------------------------------------

  /// Identifiant unique permanent.
  final String uuid;

  /// Numéro de la manche dans la session.
  final int number;

  //---------------------------------------------------------------------------
  // Participants
  //---------------------------------------------------------------------------

  /// Position du preneur dans la session.
  final int attackerPosition;

  /// Position du partenaire (appelé).
  ///
  /// Null si la partie se joue sans appelé.
  final int? partnerPosition;

  //---------------------------------------------------------------------------
  // Contrat
  //---------------------------------------------------------------------------

  /// Identifiant du contrat.
  ///
  /// Exemple :
  /// - petite
  /// - garde
  /// - garde_sans
  /// - garde_contre
  final String contractId;

  /// Nombre de bouts.
  ///
  /// Valeurs autorisées : 0 à 3.
  final int oudlers;

  /// Nombre de points réalisés.
  final double points;

  //---------------------------------------------------------------------------
  // Evènements
  //---------------------------------------------------------------------------

  /// Evènements déclarés pendant la manche.
  final List<DealEvent> events;

  //---------------------------------------------------------------------------
  // Constructeur
  //---------------------------------------------------------------------------

  const Deal({
    required this.uuid,
    required this.number,
    required this.attackerPosition,
    this.partnerPosition,
    required this.contractId,
    required this.oudlers,
    required this.points,
    this.events = const [],
  });

  //---------------------------------------------------------------------------
  // Getters métier
  //---------------------------------------------------------------------------

  /// Indique si un partenaire est présent.
  bool get hasPartner => partnerPosition != null;

  /// Recherche un évènement.
  DealEvent? event(String id) {
    for (final event in events) {
      if (event.id == id) {
        return event;
      }
    }

    return null;
  }

  /// Indique si un évènement est présent.
  bool hasEvent(String id) {
    return event(id) != null;
  }

  //---------------------------------------------------------------------------
  // Copy
  //---------------------------------------------------------------------------

  Deal copyWith({
    String? uuid,
    int? number,
    int? attackerPosition,
    int? partnerPosition,
    String? contractId,
    int? oudlers,
    double? points,
    List<DealEvent>? events,
  }) {
    return Deal(
      uuid: uuid ?? this.uuid,
      number: number ?? this.number,
      attackerPosition: attackerPosition ?? this.attackerPosition,
      partnerPosition: partnerPosition ?? this.partnerPosition,
      contractId: contractId ?? this.contractId,
      oudlers: oudlers ?? this.oudlers,
      points: points ?? this.points,
      events: events ?? this.events,
    );
  }

  //---------------------------------------------------------------------------
  // Mapping
  //---------------------------------------------------------------------------

  factory Deal.fromMap(Map<String, dynamic> map) {
    return Deal(
      uuid: map['uuid'] as String,
      number: map['number'] as int,
      attackerPosition: map['attacker_position'] as int,
      partnerPosition: map['partner_position'] as int?,
      contractId: map['contract_id'] as String,
      oudlers: map['oudlers'] as int,
      points: (map['points'] as num).toDouble(),
      // Les évènements seront chargés séparément par le repository.
      events: const [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'number': number,
      'attacker_position': attackerPosition,
      'partner_position': partnerPosition,
      'contract_id': contractId,
      'oudlers': oudlers,
      'points': points,
    };
  }

  //---------------------------------------------------------------------------
  // Divers
  //---------------------------------------------------------------------------

  @override
  String toString() {
    return 'Deal('
        'number: $number, '
        'contract: $contractId, '
        'oudlers: $oudlers, '
        'points: $points'
        ')';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Deal &&
            other.uuid == uuid &&
            other.number == number &&
            other.attackerPosition == attackerPosition &&
            other.partnerPosition == partnerPosition &&
            other.contractId == contractId &&
            other.oudlers == oudlers &&
            other.points == points;
  }

  @override
  int get hashCode {
    return Object.hash(
      uuid,
      number,
      attackerPosition,
      partnerPosition,
      contractId,
      oudlers,
      points,
    );
  }
}