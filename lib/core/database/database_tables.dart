// ***************************************************************************
//
// TarotScore V2
//
// Fichier : database_tables.dart
//
// Description : Noms des tables SQLite.
//
// Auteur : David
//
// ***************************************************************************

abstract final class DatabaseTables {
  static const players =
      'players';

  static const ruleProfiles =
      'rule_profiles';

  static const sessions =
      'sessions';

  static const sessionPlayers =
      'session_players';

  static const deals =
      'deals';

  static const dealScores =
      'deal_scores';

  static const dealEvents =
      'deal_events';
}