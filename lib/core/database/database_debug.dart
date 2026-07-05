class DatabaseDebug {
  DatabaseDebug._();

  static Future<void> reset() async {
    final dbPath = await getDatabasesPath();

    await deleteDatabase(
      join(dbPath, 'tarot_score.db'),
    );
  }
}