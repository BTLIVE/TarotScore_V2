import 'package:flutter/material.dart';

import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

class TarotScoreApp extends StatelessWidget {
  const TarotScoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TarotScore V2',

      debugShowCheckedModeBanner: false,

      theme: AppTheme.light,

      initialRoute: AppRouter.home,

      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}