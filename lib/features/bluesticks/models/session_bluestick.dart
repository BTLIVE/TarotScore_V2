// ***************************************************************************
//
// TarotScore V2
//
// Fichier : session_bluestick.dart
//
// Description : Nombre de BlueSticks d'un joueur pour une session.
//
// Auteur : David
//
// ***************************************************************************

class SessionBlueStick {
  //---------------------------------------------------------------------------
  // Identification
  //---------------------------------------------------------------------------

  /// Session concernée.
  final String sessionId;

  /// Joueur concerné.
  final String playerId;

  //---------------------------------------------------------------------------
  // Résultat
  //---------------------------------------------------------------------------

  /// Nombre de BlueSticks obtenues pendant la session.
  final int blueSticks;

  //---------------------------------------------------------------------------
  // Constructeur
  //---------------------------------------------------------------------------

  const SessionBlueStick({
    required this.sessionId,
    required this.playerId,
    this.blueSticks = 0,
  });

  //---------------------------------------------------------------------------
  // Copy
  //---------------------------------------------------------------------------

  SessionBlueStick copyWith({
    String? sessionId,
    String? playerId,
    int? blueSticks,
  }) {
    return SessionBlueStick(
      sessionId: sessionId ?? this.sessionId,
      playerId: playerId ?? this.playerId,
      blueSticks: blueSticks ?? this.blueSticks,
    );
  }

  //---------------------------------------------------------------------------
  // Getters
  //---------------------------------------------------------------------------

  bool get hasBlueSticks => blueSticks > 0;

  //---------------------------------------------------------------------------
  // Divers
  //---------------------------------------------------------------------------

  @override
  String toString() {
    return 'SessionBlueStick('
        'playerId: $playerId, '
        'blueSticks: $blueSticks'
        ')';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is SessionBlueStick &&
            other.sessionId == sessionId &&
            other.playerId == playerId &&
            other.blueSticks == blueSticks;
  }

  @override
  int get hashCode =>
      Object.hash(
        sessionId,
        playerId,
        blueSticks,
      );
}