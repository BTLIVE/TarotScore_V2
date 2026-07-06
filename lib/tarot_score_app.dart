import 'package:flutter/material.dart';

import 'core/routing/app_router.dart';
import 'core/routing/app_routes.dart';
import 'core/theme/app_theme.dart';

class TarotScoreApp extends StatelessWidget {
  const TarotScoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TarotScore V2',

      debugShowCheckedModeBanner: false,

      theme: AppTheme.light,

      themeMode: ThemeMode.light,

      initialRoute: AppRoutes.home,

      onGenerateRoute: AppRouter.onGenerateRoute,

      // Très utile plus tard
      restorationScopeId: 'tarotscore',
    );
  }
}