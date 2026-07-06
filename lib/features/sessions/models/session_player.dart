import '../../players/models/player.dart';

/// Représente un joueur pendant la préparation
/// puis le déroulement d'une partie.
///
/// Cette classe n'est jamais enregistrée en base.
/// Elle est reconstruite à chaque nouvelle session.
class SessionPlayer {
  SessionPlayer({
    required this.player,
    this.selected = false,
  });

  final Player player;

  bool selected;

  int seat = 0;

  int score = 0;

  int blueTokens = 0;
}