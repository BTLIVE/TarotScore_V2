import 'package:flutter/material.dart';

import '../../features/home/screens/home_screen.dart';
import '../../features/players/screens/player_list_screen.dart';
import 'app_routes.dart';

class AppRouter {
  AppRouter._();

  /// Génère les routes de l'application.
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
          settings: settings,
        );

      case AppRoutes.players:
        return MaterialPageRoute(
          builder: (_) => const PlayerListScreen(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const UnknownRouteScreen(),
          settings: settings,
        );
    }
  }
}

/// Écran affiché lorsqu'une route est inconnue.
class UnknownRouteScreen extends StatelessWidget {
  const UnknownRouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Erreur'),
      ),
      body: const Center(
        child: Text(
          'Page introuvable',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
