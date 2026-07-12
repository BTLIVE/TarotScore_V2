import 'package:flutter/material.dart';

import '../../features/home/presentation/pages/home_page.dart';
import '../../features/players/presentation/pages/players_page.dart';
import '../../features/rules/presentation/pages/rule_profiles_page.dart';
import '../../features/sessions/presentation/pages/current_session_page.dart';
import '../../features/sessions/presentation/pages/new_session_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
import '../../features/statistics/presentation/pages/statistics_page.dart';
import 'app_routes.dart';

class AppRouter {
  const AppRouter._();

  static Route<dynamic> onGenerateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      //----------------------------------------------------------------------
      // Accueil
      //----------------------------------------------------------------------

      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
          settings: settings,
        );

      //----------------------------------------------------------------------
      // Joueurs
      //----------------------------------------------------------------------

      case AppRoutes.players:
        return MaterialPageRoute(
          builder: (_) => const PlayersPage(),
          settings: settings,
        );

      //----------------------------------------------------------------------
      // Nouvelle partie
      //----------------------------------------------------------------------

      case AppRoutes.newSession:
        return MaterialPageRoute(
          builder: (_) => const NewSessionPage(),
          settings: settings,
        );

      //----------------------------------------------------------------------
      // Partie en cours
      //----------------------------------------------------------------------

      case AppRoutes.currentSession:
        return MaterialPageRoute(
          builder: (_) =>
              const CurrentSessionPage(),
          settings: settings,
        );

      //----------------------------------------------------------------------
      // Profils de règles
      //----------------------------------------------------------------------

      case AppRoutes.ruleProfiles:
        return MaterialPageRoute(
          builder: (_) =>
              const RuleProfilesPage(),
          settings: settings,
        );

      //----------------------------------------------------------------------
      // Statistiques
      //----------------------------------------------------------------------

      case AppRoutes.statistics:
        return MaterialPageRoute(
          builder: (_) =>
              const StatisticsPage(),
          settings: settings,
        );

      //----------------------------------------------------------------------
      // Réglages
      //----------------------------------------------------------------------

      case AppRoutes.settings:
        return MaterialPageRoute(
          builder: (_) =>
              const SettingsPage(),
          settings: settings,
        );

      //----------------------------------------------------------------------
      // Route inconnue
      //----------------------------------------------------------------------

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text(
                'Page introuvable',
              ),
            ),
          ),
          settings: settings,
        );
    }
  }
}