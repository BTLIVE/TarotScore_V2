import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'core/database/database_initializer.dart';
import 'tarot_score_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // TEMPORAIRE : suppression de la base
  final dbPath = await getDatabasesPath();
  await deleteDatabase(
    join(dbPath, 'tarot_score.db'),
  );

  await DatabaseInitializer.initialize();

  runApp(const TarotScoreApp());
}