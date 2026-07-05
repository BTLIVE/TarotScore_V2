import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseInitializer {
  DatabaseInitializer._();

  static Future<void> initialize() async {
    if (Platform.isWindows ||
        Platform.isLinux ||
        Platform.isMacOS) {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    }
  }
}