// ***************************************************************************
//
// TarotScore V2
//
// Fichier : deal_input.dart
//
// Description : Données saisies par l'utilisateur pour une donne.
//
// Cette classe est utilisée pendant la saisie d'une manche.
// Elle n'est jamais enregistrée.
//
// Auteur : David
//
// ***************************************************************************

import '../../rules/engine/models/deal_event.dart';

class DealInput {
  //---------------------------------------------------------------------------
  // Participants
  //---------------------------------------------------------------------------

  final int attackerPosition;

  final bool hasCalledPartner;

  final int? partnerPosition;

  //---------------------------------------------------------------------------
  // Contrat
  //---------------------------------------------------------------------------

  final String contractId;

  final int oudlers;

  final double points;

  //---------------------------------------------------------------------------
  // Evènements
  //---------------------------------------------------------------------------

  final List<DealEvent> events;

  //---------------------------------------------------------------------------
  // Constructeur
  //---------------------------------------------------------------------------

  const DealInput({
    required this.attackerPosition,
    this.hasCalledPartner = false,
    this.partnerPosition,
    required this.contractId,
    required this.oudlers,
    required this.points,
    this.events = const [],
  });

  //---------------------------------------------------------------------------
  // Getters
  //---------------------------------------------------------------------------

  bool get hasPartner => partnerPosition != null;

  bool get hasEvents => events.isNotEmpty;

  //---------------------------------------------------------------------------
  // Copy
  //---------------------------------------------------------------------------

  DealInput copyWith({
    int? attackerPosition,
    bool? hasCalledPartner,
    int? partnerPosition,
    String? contractId,
    int? oudlers,
    double? points,
    List<DealEvent>? events,
  }) {
    return DealInput(
      attackerPosition:
          attackerPosition ?? this.attackerPosition,
      hasCalledPartner:
          hasCalledPartner ?? this.hasCalledPartner,
      partnerPosition:
          partnerPosition ?? this.partnerPosition,
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
}