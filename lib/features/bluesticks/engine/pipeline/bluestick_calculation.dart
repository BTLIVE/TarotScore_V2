// ***************************************************************************
//
// TarotScore V2
//
// Fichier : bluestick_calculation.dart
//
// Description : Etat du calcul des BlueSticks.
//
// Auteur : David
//
// ***************************************************************************

import '../../../rules/engine/pipeline/deal_calculation.dart';
import '../../../sessions/models/deal.dart';
import '../../../sessions/models/session.dart';
import '../../models/bluestick_event.dart';
import 'bluestick_context.dart';

class BlueStickCalculation {
  //---------------------------------------------------------------------------
  // Contexte
  //---------------------------------------------------------------------------

  /// Résultat du moteur de calcul.
  final DealCalculation dealCalculation;

  /// Contexte du calcul.
  final BlueStickContext context;

  //---------------------------------------------------------------------------
  // Résultat
  //---------------------------------------------------------------------------

  /// Evènements produits par les règles.
  final List<BlueStickEvent> events;

  //---------------------------------------------------------------------------
  // Constructeur
  //---------------------------------------------------------------------------

  const BlueStickCalculation({
    required this.dealCalculation,
    required this.context,
    this.events = const [],
  });

  //---------------------------------------------------------------------------
  // Copy
  //---------------------------------------------------------------------------

  BlueStickCalculation copyWith({
    DealCalculation? dealCalculation,
    BlueStickContext? context,
    List<BlueStickEvent>? events,
  }) {
    return BlueStickCalculation(
      dealCalculation:
          dealCalculation ?? this.dealCalculation,
      context:
          context ?? this.context,
      events:
          events ?? this.events,
    );
  }

  //---------------------------------------------------------------------------
  // Getters
  //---------------------------------------------------------------------------

  /// Session en cours.
  Session get session =>
      context.session;

  /// Donne en cours de traitement.
  Deal get deal =>
      dealCalculation.deal;

  /// Des évènements ont été produits.
  bool get hasEvents =>
      events.isNotEmpty;

  /// Nombre total de BlueSticks attribuées.
  int get totalBlueSticks {
    var total = 0;

    for (final event in events) {
      total += event.quantity;
    }

    return total;
  }
}