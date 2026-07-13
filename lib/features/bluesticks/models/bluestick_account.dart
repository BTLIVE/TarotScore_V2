// ***************************************************************************
//
// TarotScore V2
//
// Fichier : bluestick_account.dart
//
// Description : Compte BlueStick permanent d'un joueur.
//
// Auteur : David
//
// ***************************************************************************

class BlueStickAccount {
  //---------------------------------------------------------------------------
  // Identification
  //---------------------------------------------------------------------------

  /// Joueur concerné.
  final String playerId;

  //---------------------------------------------------------------------------
  // Compte
  //---------------------------------------------------------------------------

  /// Nombre total de BlueSticks.
  final int totalBlueSticks;

  //---------------------------------------------------------------------------
  // Constructeur
  //---------------------------------------------------------------------------

  const BlueStickAccount({
    required this.playerId,
    this.totalBlueSticks = 0,
  });

  //---------------------------------------------------------------------------
  // Copy
  //---------------------------------------------------------------------------

  BlueStickAccount copyWith({
    String? playerId,
    int? totalBlueSticks,
  }) {
    return BlueStickAccount(
      playerId: playerId ?? this.playerId,
      totalBlueSticks:
          totalBlueSticks ??
          this.totalBlueSticks,
    );
  }

  //---------------------------------------------------------------------------
  // Divers
  //---------------------------------------------------------------------------

  @override
  String toString() {
    return 'BlueStickAccount('
        'playerId: $playerId, '
        'totalBlueSticks: $totalBlueSticks'
        ')';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is BlueStickAccount &&
            other.playerId == playerId &&
            other.totalBlueSticks ==
                totalBlueSticks;
  }

  @override
  int get hashCode =>
      Object.hash(
        playerId,
        totalBlueSticks,
      );
}