// ***************************************************************************
//
// TarotScore V2
//
// Fichier : current_session_repository.dart
//
// Description : Sauvegarde de la partie en cours.
//
// Une seule partie peut être en cours.
// Elle est sauvegardée automatiquement au format JSON.
//
// Auteur : David
//
// ***************************************************************************

import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../models/session_state.dart';
import '../serialization/session_state_serializer.dart';

class CurrentSessionRepository {
  CurrentSessionRepository._();

  static final CurrentSessionRepository instance =
      CurrentSessionRepository._();

  static const String _directoryName =
      'json';

  static const String _fileName =
      'current_session.json';

  //--------------------------------------------------------------------------
  // Fichier de sauvegarde
  //--------------------------------------------------------------------------

  Future<File> _getFile() async {
    final documents =
        await getApplicationDocumentsDirectory();

    final directory = Directory(
      '${documents.path}/$_directoryName',
    );

    if (!await directory.exists()) {
      await directory.create(
        recursive: true,
      );
    }

    return File(
      '${directory.path}/$_fileName',
    );
  }

  //--------------------------------------------------------------------------
  // Sauvegarde
  //--------------------------------------------------------------------------

  Future<void> save(
    SessionState state,
  ) async {
    final file = await _getFile();

    final json = jsonEncode(
      SessionStateSerializer.toJson(
        state,
      ),
    );

    await file.writeAsString(
      json,
      flush: true,
    );
  }

  //--------------------------------------------------------------------------
  // Chargement
  //--------------------------------------------------------------------------

  Future<SessionState?> load() async {
    final file = await _getFile();

    if (!await file.exists()) {
      return null;
    }

    final json =
        await file.readAsString();

    final map =
        jsonDecode(json)
            as Map<String, dynamic>;

    return SessionStateSerializer.fromJson(
      map,
    );
  }

  //--------------------------------------------------------------------------
  // Existence
  //--------------------------------------------------------------------------

  Future<bool> exists() async {
    final file = await _getFile();

    return file.exists();
  }

  //--------------------------------------------------------------------------
  // Suppression
  //--------------------------------------------------------------------------

  Future<void> delete() async {
    final file = await _getFile();

    if (await file.exists()) {
      await file.delete();
    }
  }
}