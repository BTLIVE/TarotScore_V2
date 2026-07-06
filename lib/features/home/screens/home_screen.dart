import 'package:flutter/material.dart';

import '../../../core/routing/app_routes.dart';
import '../../../core/widgets/dashboard_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _notImplemented(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Fonctionnalité en cours de développement'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TarotScore V2'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            DashboardCard(
              title: 'Joueurs',
              icon: Icons.people,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.players,
                );
              },
            ),
            DashboardCard(
              title: 'Nouvelle soirée',
              icon: Icons.casino,
              onTap: () => _notImplemented(context),
            ),
            DashboardCard(
              title: 'Historique',
              icon: Icons.history,
              onTap: () => _notImplemented(context),
            ),
            DashboardCard(
              title: 'Statistiques',
              icon: Icons.bar_chart,
              onTap: () => _notImplemented(context),
            ),
            DashboardCard(
              title: 'Paramètres',
              icon: Icons.settings,
              onTap: () => _notImplemented(context),
            ),
            DashboardCard(
              title: 'À propos',
              icon: Icons.info,
              onTap: () => _notImplemented(context),
            ),
          ],
        ),
      ),
    );
  }
}