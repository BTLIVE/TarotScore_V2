import 'package:flutter/material.dart';

import 'core/database/database_initializer.dart';
import 'tarot_score_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialisation des services de l'application.
  await DatabaseInitializer.initialize();

  runApp(const TarotScoreApp());
}