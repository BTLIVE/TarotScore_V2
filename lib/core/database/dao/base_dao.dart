// ***************************************************************************
//
// TarotScore V2
//
// Fichier : base_dao.dart
//
// Description : Classe de base des DAO.
//
// Fournit l'accès à la base SQLite.
//
// Auteur : David
//
// ***************************************************************************

import 'package:sqflite/sqflite.dart';

import '../database_helper.dart';

abstract class BaseDao {
  BaseDao();

  //--------------------------------------------------------------------------
  // Dépendances
  //--------------------------------------------------------------------------

  final DatabaseHelper databaseHelper =
      DatabaseHelper.instance;

  //--------------------------------------------------------------------------
  // Base de données
  //--------------------------------------------------------------------------

  Future<Database> get db async =>
      await databaseHelper.database;
}