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

import '../../rules/engine/models/deal_event.dart';

class Deal {
  //--------------------------------------------------------------------------
  // Identification
  //--------------------------------------------------------------------------

  /// Identifiant unique permanent.
  final String uuid;

  /// Numéro de la manche dans la session.
  final int number;

  //--------------------------------------------------------------------------
  // Participants
  //--------------------------------------------------------------------------

  /// Position du preneur dans la session.
  final int attackerPosition;

  /// Indique si le preneur joue avec un appelé.
  ///
  /// false :
  /// - Partie à 4 joueurs.
  /// - Partie à 5 joueurs où le preneur joue seul.
  ///
  /// true :
  /// - Partie à 5 joueurs avec un appelé.
  final bool hasCalledPartner;

  /// Position du partenaire (appelé).
  ///
  /// Null si le preneur joue seul.
  final int? partnerPosition;

  //--------------------------------------------------------------------------
  // Contrat
  //--------------------------------------------------------------------------

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

  //--------------------------------------------------------------------------
  // Evènements
  //--------------------------------------------------------------------------

  /// Evènements déclarés pendant la manche.
  final List<DealEvent> events;

  //--------------------------------------------------------------------------
  // Constructeur
  //--------------------------------------------------------------------------

  const Deal({
    required this.uuid,
    required this.number,
    required this.attackerPosition,
    this.hasCalledPartner = false,
    this.partnerPosition,
    required this.contractId,
    required this.oudlers,
    required this.points,
    this.events = const [],
  });

  //--------------------------------------------------------------------------
  // Getters métier
  //--------------------------------------------------------------------------

  /// Le preneur joue seul.
  bool get attackerAlone => !hasCalledPartner;

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

  //--------------------------------------------------------------------------
  // Copy
  //--------------------------------------------------------------------------

  Deal copyWith({
    String? uuid,
    int? number,
    int? attackerPosition,
    bool? hasCalledPartner,
    int? partnerPosition,
    String? contractId,
    int? oudlers,
    double? points,
    List<DealEvent>? events,
  }) {
    return Deal(
      uuid: uuid ?? this.uuid,
      number: number ?? this.number,
      attackerPosition:
          attackerPosition ??
              this.attackerPosition,
      hasCalledPartner:
          hasCalledPartner ??
              this.hasCalledPartner,
      partnerPosition:
          partnerPosition ??
              this.partnerPosition,
      contractId:
          contractId ?? this.contractId,
      oudlers:
          oudlers ?? this.oudlers,
      points:
          points ?? this.points,
      events:
          events ?? this.events,
    );
  }

  //--------------------------------------------------------------------------
  // Mapping
  //--------------------------------------------------------------------------

  factory Deal.fromMap(
    Map<String, dynamic> map,
  ) {
    final partnerPosition =
        map['partner_position'] as int?;

    return Deal(
      uuid: map['uuid'] as String,

      number: map['number'] as int,

      attackerPosition:
          map['attacker_position'] as int,

      hasCalledPartner:
          partnerPosition != null,

      partnerPosition:
          partnerPosition,

      contractId:
          map['contract_id'] as String,

      oudlers:
          map['oudlers'] as int,

      points:
          (map['points'] as num)
              .toDouble(),

      // Les évènements seront chargés
      // séparément par le repository.
      events: const [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'number': number,
      'attacker_position':
          attackerPosition,
      'has_called_partner':
          hasCalledPartner ? 1 : 0,
      'partner_position':
          partnerPosition,
      'contract_id':
          contractId,
      'oudlers':
          oudlers,
      'points':
          points,
    };
  }

  //--------------------------------------------------------------------------
  // Divers
  //--------------------------------------------------------------------------

  @override
  String toString() {
    return 'Deal('
        'number: $number, '
        'contract: $contractId, '
        'calledPartner: $hasCalledPartner, '
        'oudlers: $oudlers, '
        'points: $points'
        ')';
  }

  @override
  bool operator ==(
    Object other,
  ) {
    return identical(this, other) ||
        other is Deal &&
            other.uuid == uuid &&
            other.number == number &&
            other.attackerPosition ==
                attackerPosition &&
            other.hasCalledPartner ==
                hasCalledPartner &&
            other.partnerPosition ==
                partnerPosition &&
            other.contractId ==
                contractId &&
            other.oudlers ==
                oudlers &&
            other.points ==
                points;
  }

  @override
  int get hashCode {
    return Object.hash(
      uuid,
      number,
      attackerPosition,
      hasCalledPartner,
      partnerPosition,
      contractId,
      oudlers,
      points,
    );
  }
}